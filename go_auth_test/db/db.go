package db

import (
	"context"
	"go-auth-test/auth"
	"log"
	"os"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
	"github.com/mitchellh/mapstructure"
	"google.golang.org/api/iterator"
	"google.golang.org/api/option"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

var UserCollectionName = "test-users"

type DB struct {
	Client *firestore.Client
}

func Init() (*DB, error) {
	var err error
	ctx := context.Background()
	sa := option.WithCredentialsJSON([]byte(os.Getenv("FIREBASE_KEY")))
	app, err := firebase.NewApp(ctx, nil, sa)
	if err != nil {
		log.Fatalln(err)
	}

	client, err := app.Firestore(ctx)
	if err != nil {
		return nil, err
	}
	db := &DB{}
	db.Client = client
	return db, nil
}

func (d *DB) Close() {
	d.Client.Close()
}

func (d *DB) checkExistingUser(u auth.User) (bool, error) {
	ctx := context.Background()
	_, err := d.Client.Collection(UserCollectionName).Doc(u.UUID).Get(ctx)
	if err != nil {
		// if the document doesn't exist, we can return false
		// if there is an error other than not found, we should return the error
		if status.Code(err) == codes.NotFound {
			return false, nil
		}
		return false, err
	}
	return true, nil
}

func (d *DB) InsertUser(u auth.User) error {
	ctx := context.Background()
	exists, err := d.checkExistingUser(u)
	if err != nil {
		return err
	}
	if exists {
		return nil
	}
	_, err = d.Client.Collection(UserCollectionName).Doc(u.UUID).Set(ctx, u)
	if err != nil {
		return err
	}
	return nil
}

// GetUsersByUUID retrieves all users whose UUID starts with the given prefix.
func (d *DB) GetUsersByUUID(UUIDPrefix string, includePassword bool, limit int) ([]*auth.User, error) {
	ctx := context.Background()

	if limit == -1 {
		limit = 10
	}

	query := d.Client.Collection(UserCollectionName).
		Where("uuid", ">=", UUIDPrefix).
		Where("uuid", "<=", UUIDPrefix+"\uf8ff").
		Limit(limit)

	iter := query.Documents(ctx)
	defer iter.Stop()

	var users []*auth.User

	// Iterate over all matching documents.
	for {
		doc, err := iter.Next()
		if err == iterator.Done {
			break
		}
		if err != nil {
			return nil, err
		}

		userDocMap := doc.Data()
		user := &auth.User{}
		err = mapstructure.Decode(userDocMap, user)
		if err != nil {
			return nil, err
		}

		if !includePassword {
			user.Password = ""
		}

		users = append(users, user)
	}

	return users, nil
}

func (d *DB) AddPurchaseToDB(UUID string, p auth.Purchase) error {
	ctx := context.Background()
	userDoc, err := d.Client.Collection(UserCollectionName).Doc(UUID).Get(ctx)
	if err != nil {
		return err
	}
	userDocMap := userDoc.Data()
	user := &auth.User{}
	err = mapstructure.Decode(userDocMap, user)
	if err != nil {
		return err
	}
	user.Purchases = append(user.Purchases, p)
	_, err = d.Client.Collection(UserCollectionName).Doc(UUID).Set(ctx, user)
	if err != nil {
		return err
	}
	return nil
}
