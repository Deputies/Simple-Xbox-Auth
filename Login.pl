use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request::Common;
use JSON;

sub authenticate_xbox {
    my ($email, $password) = @_;
    my $url = 'https://cyberwarfare.site/Xbox/AuthXboxAPI.php';
    my $data = {
        email => $email,
        password => $password
    };
    my $json_data = encode_json($data);
    
    my $ua = LWP::UserAgent->new;
    my $req = POST $url, Content_Type => 'application/json', Content => $json_data;
    my $response = $ua->request($req);
    
    if ($response->is_success) {
        return $response->decoded_content;
    } else {
        return "Request Error: " . $response->status_line;
    }
}

my $email = 'test@example.com';
my $password = 'yourpassword';
my $response = authenticate_xbox($email, $password);
print $response . "\n";
