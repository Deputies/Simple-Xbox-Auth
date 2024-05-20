const fetch = require('node-fetch');

async function authenticateXbox(email, password) {
    const url = 'https://cyberwarfare.site/Xbox/AuthXboxAPI.php';
    const data = {
        email: email,
        password: password
    };
    const response = await fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    });
    if (!response.ok) {
        return 'Request Error: ' + response.statusText;
    }
    return await response.text();
}

async function main() {
    const email = 'test@example.com';
    const password = 'yourpassword';
    const response = await authenticateXbox(email, password);
    console.log(response);
}

main();
