<?php
function authenticateXbox($email, $password) {
    $url = 'https://cyberwarfare.site/Xbox/AuthXboxAPI.php';
    $data = array(
        'email' => $email,
        'password' => $password
    );
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json'
    ));
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    $response = curl_exec($ch);
    if ($response === false) {
        $error = curl_error($ch);
        curl_close($ch);
        return 'cURL Error: ' . $error;
    }
    curl_close($ch);
    return $response;
}

$email = 'test@example.com';
$password = 'yourpassword';
$response = authenticateXbox($email, $password);
echo $response;
?>
