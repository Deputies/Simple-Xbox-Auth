import requests
import json

def authenticate_xbox(email, password):
    url = 'https://cyberwarfare.site/Xbox/AuthXboxAPI.php'
    data = {
        'email': email,
        'password': password
    }
    headers = {
        'Content-Type': 'application/json'
    }
    response = requests.post(url, headers=headers, data=json.dumps(data))
    if response.status_code != 200:
        return 'Request Error: ' + response.text
    return response.text

email = 'test@example.com'
password = 'yourpassword'
response = authenticate_xbox(email, password)
print(response)
