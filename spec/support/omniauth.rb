
OmniAuth.config.test_mode = true

# Inside our integration tests for Oauth
ACCESS_TOKEN = {
  :access_token => "plataformatec"
}

OmniAuth.config.mock_auth[:facebook] = {
  :id => '12345',
  :link => 'http://facebook.com/user_example',
  :email => 'user@example.com',
  :first_name => 'User',
  :last_name => 'Example',
  :website => 'http://blog.plataformatec.com.br'
}

#BULLSHIT = {"user_info"=>
#  {"name"=>"Tyler Gannon", 
#   "urls"=>{"Facebook"=>"http://www.facebook.com/tyboji", "Website"=>nil}, 
#   "nickname"=>"tyboji", 
#   "last_name"=>"Gannon", 
#   "first_name"=>"Tyler"
#  }, 
#  "uid"=>"6714565", 
#  "credentials"=>{"token"=>"111380765596113|f0b273423fd650e7e34183ab-6714565|imq0U8JaQQZBCOtruQkUWOPavuw"}, 
#  "extra"=>
#  {
#    "user_hash"=>
#    {
#      "name"=>"Tyler Gannon", 
#      "timezone"=>-8, 
#      "gender"=>"male", 
#      "id"=>"6714565", 
#      "last_name"=>"Gannon", 
#      "updated_time"=>"2010-12-23T21:38:26+0000", 
#      "verified"=>true, 
#      "locale"=>"en_US", 
#      "link"=>"http://www.facebook.com/tyboji", 
#      "email"=>"tgannon@gmail.com", "first_name"=>"Tyler"
#    }
#  }, 
#  "provider"=>"facebook"
#}

#   Devise::OmniAuth.short_circuit_authorizers!
#   Devise::OmniAuth.stub!(:facebook) do |b|
#     b.post('/oauth/access_token') { [200, {}, ACCESS_TOKEN.to_json] }
#     b.get('/me?access_token=plataformatec') { [200, {}, FACEBOOK_INFO.to_json] }
#   end

