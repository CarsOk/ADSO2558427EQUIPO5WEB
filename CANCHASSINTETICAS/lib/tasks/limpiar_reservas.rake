namespace :limpiar_reservas do
    desc "Elimina las reservas no asociadas a un usuario"
    task eliminar: :environment do
      reservas_a_eliminar = Reserva.where(usuario_id: nil)
      puts "Reservas a eliminar: #{reservas_a_eliminar.pluck(:id)}"
      
      reservas_a_eliminar.destroy_all
      
      puts "Reservas no asociadas eliminadas exitosamente."
    end
  end
  