package auth

import "time"

// for now, we will use the ID as the UUID, but that may change in the future
// ID is the student ID and UUID is an internal ID field

type User struct {
	UUID          string     `json:"uuid" firestore:"uuid" mapstructure:"uuid"`
	Email         string     `json:"email" firestore:"email" mapstructure:"email"`
	Password      string     `json:"password" firestore:"password" mapstructure:"password"`
	ID            string     `json:"id" firestore:"id" mapstructure:"id"`
	Phone         string     `json:"phone" firestore:"phone" mapstructure:"phone"`
	FirstName     string     `json:"first_name" firestore:"first_name" mapstructure:"first_name"`
	LastName      string     `json:"last_name" firestore:"last_name" mapstructure:"last_name"`
	Purchases     []Purchase `json:"purchases" firestore:"purchases" mapstructure:"purchases"`
	CurrentPoints int        `json:"current_points" firestore:"current_points" mapstructure:"current_points"`
	Admin         bool       `json:"admin" firestore:"admin" mapstructure:"admin"`
}

type Purchase struct {
	DateTime   time.Time      `json:"datetime" firestore:"datetime" mapstructure:"datetime"`
	Properties map[string]any `json:"properties" firestore:"properties" mapstructure:"properties"`
	ID         string         `json:"id" firestore:"id" mapstructure:"id"`
}

type PurchaseRequest struct {
	Purchase Purchase `json:"purchase" mapstructure:"purchase"`
	UUID     string   `json:"uuid" mapstructure:"uuid"`
}

type UserRequest struct {
	UUID string `json:"uuid" mapstructure:"uuid"`
}
