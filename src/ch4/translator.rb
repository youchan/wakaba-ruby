require "httpclient"
require "uri"

class Translator
  def initialize
    @http = HTTPClient.new
  end

  def translate(text)
    encoded_text = URI.encode(text)
    json = @http.get("https://script.google.com/macros/s/...長い文字列.../exec?q=#{encoded_text}", :follow_redirect => true).body
    JSON.parse(json)["body"]
  end
end

