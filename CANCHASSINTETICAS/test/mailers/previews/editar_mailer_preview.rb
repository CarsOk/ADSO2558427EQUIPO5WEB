# Preview all emails at http://localhost:3000/rails/mailers/editar_mailer
class EditarMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/editar_mailer/reserva_modificada
  def reserva_modificada
    EditarMailer.reserva_modificada(Reserva.last)
  end

end
