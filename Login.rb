require 'net/http'
require 'json'

def authenticate_xbox(email, password)
  url = URI('https://cyberwarfare.site/Xbox/AuthXboxAPI.php')
  data = { email: email, password: password }
  headers = { 'Content-Type' => 'application/json' }

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true if url.scheme == 'https'

  request = Net::HTTP::Post.new(url, headers)
  request.body = data.to_json

  response = http.request(request)

  if response.code == '200'
    return response.body
  else
    return "Request Error: #{response.message}"
  end
end

email = 'test@example.com'
password = 'yourpassword'
response = authenticate_xbox(email, password)
puts response
