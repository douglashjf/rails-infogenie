class AlertArticlesController < ApplicationController

  def cron
    NewsAlertService.perform_cron
  end
end
