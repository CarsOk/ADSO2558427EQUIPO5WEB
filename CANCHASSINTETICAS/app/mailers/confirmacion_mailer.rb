class ConfirmacionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmacion_mailer.reserva.subject
  #
  def reserva(reserva)
    @reserva = reserva
    mail to: @reserva.usuario.email, subject: 'Reserva confirmada'
  end  
end
