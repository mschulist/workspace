package main

import (
	"go-auth-test/controller"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
	_ "github.com/joho/godotenv/autoload"
)

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/login", controller.Login).Methods("POST")
	router.HandleFunc("/adduser", controller.AddUser).Methods("POST")
	router.HandleFunc("/getuser", controller.GetUser).Methods("GET")
	router.HandleFunc("/addpurchase", controller.AddPurchase).Methods("PUT")
	router.HandleFunc("/getuseradmin", controller.GetUserAdmin).Methods("GET")

	http.Handle("/", router)

	addr := "0.0.0.0:8000"

	srv := &http.Server{
		Handler:      router,
		Addr:         addr,
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Println("Server started!")
	srv.ListenAndServe()
}
