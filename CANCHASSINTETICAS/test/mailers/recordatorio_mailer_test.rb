require "test_helper"

class RecordatorioMailerTest < ActionMailer::TestCase
  test "recordar_reserva" do
    mail = RecordatorioMailer.recordar_reserva
    assert_equal "Recordar reserva", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
