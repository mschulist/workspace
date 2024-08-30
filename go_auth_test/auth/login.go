package auth

import (
	"errors"
	"fmt"
	"os"
	"time"

	"github.com/golang-jwt/jwt"
	"golang.org/x/crypto/bcrypt"
)

var tokenSecret = os.Getenv("TOKEN_SECRET")

func CreateJWTToken(u User) (string, error) {

	authToken := jwt.MapClaims{
		"authorized": true,
		"uuid":       u.UUID,
		"admin":      u.Admin,
		"exp":        time.Now().Add(time.Hour * 24 * 7).Unix(),
	}

	if tokenSecret == "" {
		return "", fmt.Errorf("TOKEN_SECRET not set")
	}

	AuthToken, err := jwt.NewWithClaims(
		jwt.SigningMethodHS256,
		authToken,
	).SignedString([]byte(tokenSecret))
	if err != nil {
		return "", err
	}

	return AuthToken, nil

}

func ValidateJWTToken(tokenString string) (jwt.MapClaims, error) {
	if tokenSecret == "" {
		return nil, fmt.Errorf("TOKEN_SECRET not set")
	}
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		return []byte(tokenSecret), nil
	})
	if err != nil {
		return nil, err
	}
	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		return claims, nil
	}
	return nil, fmt.Errorf("invalid token")
}

func HashPassword(password string) (string, error) {
	hashedPass, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return "", err
	}
	return string(hashedPass), nil
}

func VerifyPassword(hashedPassword, password string) error {
	err := bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(password))
	if err != nil {
		return err
	}
	return nil
}

// ExtractTokenUUID extracts the UUID from a JWT token
// returns an error if the token is invalid
func ExtractTokenUUID(tokenString string) (string, error) {
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}
		return []byte(tokenSecret), nil
	})

	if err != nil {
		return "", fmt.Errorf("error parsing token: %w", err)
	}
	claims, ok := token.Claims.(jwt.MapClaims)
	if ok && token.Valid {
		return claims["uuid"].(string), nil
	}
	return "", errors.New("internal error")
}

// ExtractTokenAdmin extracts the admin status from a JWT token
// returns an error if the token is invalid
func ExtractTokenAdmin(tokenString string) (bool, error) {
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}
		return []byte(tokenSecret), nil
	})

	if err != nil {
		return false, fmt.Errorf("error parsing token: %w", err)
	}
	claims, ok := token.Claims.(jwt.MapClaims)
	if ok && token.Valid {
		return claims["admin"].(bool), nil
	}
	return false, errors.New("internal error")
}
