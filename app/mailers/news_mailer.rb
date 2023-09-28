class NewsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.news_mailer.news_alert.subject
  #
  def news_alert
    @user = params[:user]
    @email = params[:email]


    @greeting = "Hi"

    mail(
      from: "Jason <support@infogenie.com>",
      to: email_address_with_name(@email, @user.first_name),
      subject: "#{DateTime.now.strftime('%d-%b-%Y')} News"
    )
  end
end
