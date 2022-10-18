require "test_helper"

class TaskMailerTest < ActionMailer::TestCase
  test "task_assigned" do
    mail = TaskMailer.task_assigned
    assert_equal "Task assigned", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
