class RecordatorioMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.recordatorio_mailer.recordar_reserva.subject
  #
  def recordar_reserva(reserva)
    @reserva = reserva
    mail to: @reserva.usuario.email, subject: 'Recordatorio'
  end
end
