require 'net/http'
require 'json'

class NewsApiService
  def initialize(api_token)
    @api_token = api_token
  end

  def get_news(primary_keywords)
    query = primary_keywords.gsub(' ', '+')
    page_size = 3 # set your desired number of news results
    url = URI.parse("https://newsapi.org/v2/everything?q=#{query}&from=2023-09-20&to=2023-09-23&sortBy=popularity&pageSize=#{page_size}&language=en&apiKey=#{@api_token}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')
    request = Net::HTTP::Get.new(url.request_uri)

    response = http.request(request)

    if response.is_a?(Net::HTTPSuccess)
      response_body = response.body
      parsed_response = JSON.parse(response_body)
      return parsed_response["articles"]
    else
      # Handle the error gracefully, you can raise an exception or return an error message
      return nil
    end
  end
end
