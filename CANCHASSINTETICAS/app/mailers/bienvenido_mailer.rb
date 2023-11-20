class BienvenidoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bienvenido_mailer.usuario.subject
  #
  def usuario
    @usuario = params[:usuario] 
    mail to: @usuario.email
  end
end
