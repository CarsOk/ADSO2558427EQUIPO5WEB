class BienvenidoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bienvenido_mailer.usuario.subject
  #
  def usuario
    @user = usuario
    @bienvenida = "Bienvenido a Sport World"
    mail to: @user, subject: '¡Bienvenido!'
  end
end
