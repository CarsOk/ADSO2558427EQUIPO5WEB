class BienvenidoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bienvenido_mailer.usuario.subject
  #
  def usuario(usuario)
    @usuario = usuario
    mail to: @usuario.email, subject: '¡Bienvenido!'
  end
end
