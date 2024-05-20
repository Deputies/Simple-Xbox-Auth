package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

func authenticateXbox(email string, password string) (string, error) {
	url := "https://cyberwarfare.site/Xbox/AuthXboxAPI.php"
	data := map[string]string{"email": email, "password": password}
	jsonData, err := json.Marshal(data)
	if err != nil {
		return "", err
	}

	resp, err := http.Post(url, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	if resp.StatusCode != http.StatusOK {
		return fmt.Sprintf("Request Error: %s", resp.Status), nil
	}

	return string(body), nil
}

func main() {
	email := "test@example.com"
	password := "yourpassword"
	response, err := authenticateXbox(email, password)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	fmt.Println(response)
}
