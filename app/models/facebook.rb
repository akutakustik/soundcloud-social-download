require 'rubygems'
require 'httparty'

class Facebook

  include HTTParty
  base_uri 'https://graph.facebook.com'
  format :json
  
  def initialize(access_token)
    self.class.default_params :access_token => access_token
  end

end