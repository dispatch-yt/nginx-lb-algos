package main
import (
	"encoding/json"
	"net/http"
	"log"
	"github.com/gorilla/mux"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Received request to /api/hello")

	message := map[string]string{"message": "Hello World!!"}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(message)
}

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/api/hello", helloHandler).Methods("GET")

	http.Handle("/", router)
	http.ListenAndServe("0.0.0.0:8086", nil)
}
