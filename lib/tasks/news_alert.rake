namespace :news_alerts do
  desc "refresh favourite news article"
  task alert: :environment do
    NewsAlertJob.perform_now
  end
end
