#!/bin/bash

email="test@example.com"
password="yourpassword"
url="https://cyberwarfare.site/Xbox/AuthXboxAPI.php"
json=$(jq -n --arg email "$email" --arg password "$password" '{email: $email, password: $password}')

response=$(curl -s -X POST -H "Content-Type: application/json" -d "$json" "$url")

echo "$response"
