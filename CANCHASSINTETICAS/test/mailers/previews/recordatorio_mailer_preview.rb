# Preview all emails at http://localhost:3000/rails/mailers/recordatorio_mailer
class RecordatorioMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/recordatorio_mailer/recordar_reserva
  def recordar_reserva
    RecordatorioMailer.recordar_reserva(Reserva.last)
  end

end
