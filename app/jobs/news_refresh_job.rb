class NewsRefreshJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    puts "im starting a job"
    sleep 3
    puts "its done"
  end
end
