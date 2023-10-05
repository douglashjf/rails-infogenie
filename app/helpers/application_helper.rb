module ApplicationHelper
# app/helpers/application_helper.rb

  def whatsapp_share_url
    current_page_url = request.original_url
    encoded_url = CGI.escape(current_page_url)
    "https://api.whatsapp.com/send?text=#{encoded_url}"
  end


  def encoded_url(url)
    URI.encode_www_form_component(url)
  end

  def twitter_share_url(primary_keywords, secondary_keywords)
    current_page_url = request.original_url
    encoded_url = CGI.escape(current_page_url)
    "https://twitter.com/share?text=Find out the latest trends on #{primary_keywords}%0A%0A&url=#{encoded_url}%0A%0A&hashtags=Infogenie,Networth,Network,#{primary_keywords.gsub(" ", "")},#{secondary_keywords.gsub(" ", "")}"

  end
end
