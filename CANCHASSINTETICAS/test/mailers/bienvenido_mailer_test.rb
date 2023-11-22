require "test_helper"

class BienvenidoMailerTest < ActionMailer::TestCase
  test "usuario" do
    mail = BienvenidoMailer.usuario
    assert_equal "Usuario", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
