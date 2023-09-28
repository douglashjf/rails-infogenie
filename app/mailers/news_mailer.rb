class NewsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.news_mailer.news_alert.subject
  #
  def news_alert
    @user = params[:user]
    @emails = params[:emails]
    @favourites = params[:favourites]

    @greeting = "Hi"

    mail(
      from: "Jason <support@infogenie.com>",
      to: email_address_with_name(User.last.email, User.last.first_name),
      subject: "#{DateTime.now.strftime('%d-%b-%Y')} News"
    )
  end
end
