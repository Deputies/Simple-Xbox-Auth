@echo off
setlocal enabledelayedexpansion

set "email=test@example.com"
set "password=yourpassword"
set "url=https://cyberwarfare.site/Xbox/AuthXboxAPI.php"
set "json={\"email\":\"%email%\",\"password\":\"%password%\"}"

curl -X POST -H "Content-Type: application/json" -d "%json%" %url%

endlocal
