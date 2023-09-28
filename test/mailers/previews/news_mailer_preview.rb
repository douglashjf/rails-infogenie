# Preview all emails at http://localhost:3000/rails/mailers/news_mailer
class NewsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/news_mailer/news_alert
  def news_alert
    NewsMailer.with(user: User.last, emails: User.all.pluck(:email), favourites: User.last.favourites).news_alert
  end

end
