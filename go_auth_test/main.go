package main

import (
	"go-auth-test/controller"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
	_ "github.com/joho/godotenv/autoload"
	"github.com/ulule/limiter/v3"
	"github.com/ulule/limiter/v3/drivers/middleware/stdlib"
	"github.com/ulule/limiter/v3/drivers/store/memory"
)

func main() {
	// Define a rate limit: 5 requests per minute per IP
	rate := limiter.Rate{
		Period: 1 * time.Minute,
		Limit:  5,
	}

	// Create a store for the rate limiter
	store := memory.NewStore()

	// Create the rate limiter middleware
	middleware := stdlib.NewMiddleware(limiter.New(store, rate))

	// Initialize the router
	router := mux.NewRouter()
	router.HandleFunc("/login", controller.Login).Methods(http.MethodPost)
	router.HandleFunc("/adduser", controller.AddUser).Methods(http.MethodPost)
	router.HandleFunc("/getuser", controller.GetUser).Methods(http.MethodGet)
	router.HandleFunc("/addpurchase", controller.AddPurchase).Methods(http.MethodPut)
	router.HandleFunc("/getuseradmin", controller.GetUserAdmin).Methods(http.MethodPost)

	// Apply the rate limiter middleware to all routes
	http.Handle("/", middleware.Handler(router))

	// Set the server address and timeouts
	addr := "0.0.0.0:8000"
	srv := &http.Server{
		Handler:      router,
		Addr:         addr,
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Println("Server started on port 8000")
	srv.ListenAndServe()
}
