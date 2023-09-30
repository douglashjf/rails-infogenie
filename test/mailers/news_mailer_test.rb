require "test_helper"

class NewsMailerTest < ActionMailer::TestCase
  test "news_alert" do
    mail = NewsMailer.news_alert
    assert_equal "News alert", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
