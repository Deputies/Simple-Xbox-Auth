using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

class Program
{
    static async Task<string> AuthenticateXbox(string email, string password)
    {
        var url = "https://cyberwarfare.site/Xbox/AuthXboxAPI.php";
        var data = new
        {
            email = email,
            password = password
        };
        var json = Newtonsoft.Json.JsonConvert.SerializeObject(data);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        using (var client = new HttpClient())
        {
            var response = await client.PostAsync(url, content);
            if (!response.IsSuccessStatusCode)
            {
                return "Request Error: " + response.ReasonPhrase;
            }
            return await response.Content.ReadAsStringAsync();
        }
    }

    static async Task Main(string[] args)
    {
        var email = "test@example.com";
        var password = "yourpassword";
        var response = await AuthenticateXbox(email, password);
        Console.WriteLine(response);
    }
}
