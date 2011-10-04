require 'httparty'
require 'cgi'

module Bitly

  class Config
    attr_accessor :login, :api_key  
  end

  @@config = Config.new

  def self.config
    @@config
  end

  def self.configure
    yield @@config
  end

  class Api
    include HTTParty

    base_uri "http://api.bitly.com/v3"

    def get(path, args = {})
      self.class.get(path, :query => args.merge('login' => Bitly.config.login, 'apiKey' => Bitly.config.api_key))
    end

    def shorten(url)
      response = get("/shorten", "longUrl" => url)
      response.code == 200 ? response.parsed_response['data']['url'] : nil
    end

  end
end
