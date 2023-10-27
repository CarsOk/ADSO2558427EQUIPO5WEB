class ReservationMailer < ApplicationMailer
    class ReservationMailer < ApplicationMailer
        def confirmation_email(reserva)
          @reserva = reserva
          mail(to: @reserva.email, subject: 'Confirmación de Reserva')
        end
      end
         
end
