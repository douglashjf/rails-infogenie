module ApplicationHelper
# app/helpers/application_helper.rb

def whatsapp_share_url
  current_page_url = request.original_url
  encoded_url = CGI.escape(current_page_url)
  "https://api.whatsapp.com/send?text=#{encoded_url}"
end

end
