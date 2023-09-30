namespace :news_alerts do
  desc "refresh favourite news article"
  task alert: :environment do
    NewsRefreshJob.perform_now
  end
end
