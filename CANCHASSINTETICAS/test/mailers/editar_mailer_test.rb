require "test_helper"

class EditarMailerTest < ActionMailer::TestCase
  test "reserva_modificada" do
    mail = EditarMailer.reserva_modificada
    assert_equal "Reserva modificada", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
