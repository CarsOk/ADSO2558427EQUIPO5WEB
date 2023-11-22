# Preview all emails at http://localhost:3000/rails/mailers/confirmacion_mailer
class ConfirmacionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/confirmacion_mailer/reserva
  def reserva
    ConfirmacionMailer.reserva(Reserva.last)
  end

end
