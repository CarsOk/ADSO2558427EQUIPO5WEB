namespace :reservas do
    desc "Actualiza el estado de las reservas"
    task actualizar_estado: :environment do
      Reserva.find_each(&:actualizar_estado)
      puts "Estados de reservas actualizados correctamente."
    end
  end