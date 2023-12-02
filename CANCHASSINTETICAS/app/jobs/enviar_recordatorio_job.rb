class EnviarRecordatorioJob < ApplicationJob
  queue_as :default

  def perform(reserva_id)
    reserva = Reserva.find(reserva_id)
    RecordatorioMailer.recordar_reserva(reserva).deliver_now
  end
end