require "test_helper"

class ConfirmacionMailerTest < ActionMailer::TestCase
  test "reserva" do
    mail = ConfirmacionMailer.reserva
    assert_equal "Reserva", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
