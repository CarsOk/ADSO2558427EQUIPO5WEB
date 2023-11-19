# Preview all emails at http://localhost:3000/rails/mailers/bienvenido_mailer
class BienvenidoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/bienvenido_mailer/usuario
  def usuario
    BienvenidoMailer.usuario
  end

end
