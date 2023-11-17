namespace :reservas do
    desc "Elimina todas las reservas que no cumplen con las restricciones de horario"
    task eliminar_reservas: :environment do
      Reserva.transaction do
        Reserva.all.each do |reserva|
          unless reserva.cumple_restricciones_horario?
            reserva.destroy
          end
        end
        puts "Reservas eliminadas correctamente según las restricciones de horario."
      end
    end
end