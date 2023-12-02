class EditarMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.editar_mailer.reserva_modificada.subject
  #
  def reserva_modificada(reserva)
    @reserva = reserva
    mail to: @reserva.usuario.email, subject: 'Reserva modificada'
  end  
end
