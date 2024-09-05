package controller

import (
	"encoding/json"
	"fmt"
	"go-auth-test/auth"
	"go-auth-test/db"
	"io"
	"net/http"
)

// Login is a handler that authenticates a user given a UUID and password and returns a JWT token
func Login(w http.ResponseWriter, r *http.Request) {
	reqBody, _ := io.ReadAll(r.Body)
	var tmpUser auth.User
	json.Unmarshal(reqBody, &tmpUser)

	db, err := db.Init()
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to connect to database: ", err), http.StatusInternalServerError)
		return
	}

	users, err := db.GetUsersByUUID(tmpUser.UUID, true, 1) // we need the password to verify it
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to retrieve user from database: ", err), http.StatusInternalServerError)
		return
	}
	if len(users) == 0 {
		http.Error(w, "User not found", http.StatusNotFound)
		return
	}
	user := users[0]

	// check if the password is correct
	err = auth.VerifyPassword(user.Password, tmpUser.Password)
	if err != nil {
		http.Error(w, fmt.Sprint("Invalid password: ", err), http.StatusUnauthorized)
		return
	}

	jwtToken, err := auth.CreateJWTToken(*user)
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to create JWT token: ", err), http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{"jwt": jwtToken})

	defer db.Close()
}

// AddUser is a handler that adds a user to the database and returns a JWT token
func AddUser(w http.ResponseWriter, r *http.Request) {
	reqBody, err := io.ReadAll(r.Body)
	if err != nil {
		http.Error(w, "Unable to read request body", http.StatusBadRequest)
		return
	}

	var tmpUser auth.User
	err = json.Unmarshal(reqBody, &tmpUser)
	if err != nil {
		http.Error(w, fmt.Sprint("Invalid JSON format: ", err), http.StatusBadRequest)
		return
	}

	db, err := db.Init()
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to connect to database: ", err), http.StatusInternalServerError)
		return
	}

	// check to see if the user already exists by uuid
	_, err = db.GetUsersByUUID(tmpUser.UUID, false, 1)
	if err == nil {
		http.Error(w, "User already exists", http.StatusConflict)
		return
	}

	// hash the password
	hashedPass, err := auth.HashPassword(tmpUser.Password)
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to hash password: ", err), http.StatusInternalServerError)
		return
	}
	tmpUser.Password = hashedPass

	db.InsertUser(tmpUser)
	defer db.Close()

	jwtToken, err := auth.CreateJWTToken(tmpUser)
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to create JWT token: ", err), http.StatusInternalServerError)
		return
	}
	fmt.Println(jwtToken)

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]string{"jwt": jwtToken})
}

func GetUser(w http.ResponseWriter, r *http.Request) {
	jwt := r.Header.Get("Authorization")
	fmt.Println(jwt)

	uuid, err := auth.ExtractTokenUUID(jwt)
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to extract UUID from token: ", err), http.StatusBadRequest)
		return
	}

	db, err := db.Init()
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to connect to database: ", err), http.StatusInternalServerError)
		return
	}

	users, err := db.GetUsersByUUID(uuid, false, 1)
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to retrieve user from database: ", err), http.StatusInternalServerError)
		return
	}
	if len(users) == 0 {
		http.Error(w, "User not found", http.StatusNotFound)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(users[0])
}

// AddPurchase is a handler that adds a purchase to the user's purchases and returns the updated user
// User must be an "admin" to add a purchase
func AddPurchase(w http.ResponseWriter, r *http.Request) {
	jwt := r.Header.Get("Authorization")
	admin, err := auth.ExtractTokenAdmin(jwt)
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to extract admin from token: ", err), http.StatusBadRequest)
		return
	}

	if !admin {
		http.Error(w, "User is not an admin", http.StatusUnauthorized)
		return
	}

	reqBody, err := io.ReadAll(r.Body)
	if err != nil {
		http.Error(w, "Unable to read request body", http.StatusBadRequest)
		return
	}

	var purchaseReq auth.PurchaseRequest
	err = json.Unmarshal(reqBody, &purchaseReq)
	if err != nil {
		http.Error(w, fmt.Sprint("Invalid JSON format: ", err), http.StatusBadRequest)
		return
	}

	db, err := db.Init()
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to connect to database: ", err), http.StatusInternalServerError)
		return
	}

	err = db.AddPurchaseToDB(purchaseReq.UUID, purchaseReq.Purchase)
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to add purchase to database: ", err), http.StatusInternalServerError)
	}

	// get the updated user
	users, err := db.GetUsersByUUID(purchaseReq.UUID, false, 1)
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to retrieve user from database: ", err), http.StatusInternalServerError)
		return
	}
	if len(users) == 0 {
		http.Error(w, "User not found", http.StatusNotFound)
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(users[0])
}

func GetUserAdmin(w http.ResponseWriter, r *http.Request) {
	jwt := r.Header.Get("Authorization")
	fmt.Println("getuseradmin", jwt)
	admin, err := auth.ExtractTokenAdmin(jwt)
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to extract admin from token: ", err), http.StatusBadRequest)
		return
	}

	if !admin {
		http.Error(w, "User is not an admin", http.StatusUnauthorized)
		return
	}

	// now that we know the person making the request is an admin, we can get the user from
	// the body of the request

	reqBody, err := io.ReadAll(r.Body)
	if err != nil {
		http.Error(w, "Unable to read request body", http.StatusBadRequest)
		return
	}

	var userReq auth.UserRequest
	err = json.Unmarshal(reqBody, &userReq)
	if err != nil {
		http.Error(w, fmt.Sprint("Invalid JSON format: ", err), http.StatusBadRequest)
		return
	}

	db, err := db.Init()
	if err != nil {
		http.Error(w, fmt.Sprint("Unable to connect to database: ", err), http.StatusInternalServerError)
		return
	}

	users, err := db.GetUsersByUUID(userReq.UUID, false, -1)
	if err != nil {
		users = []*auth.User{}
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(users)
}
