namespace :news_refresh do
  desc "refresh favourite news article"
  task refresh: :environment do
    NewsRefreshJob.perform_now
  end

end
