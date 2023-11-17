class Reserva < ApplicationRecord
  #Asociaciones
  belongs_to :usuario
  belongs_to :cancha
  validate :validar_minutos
  validate :validar_horarios

  #Metodos
  private
  
  def validar_minutos
    if hora_inicio.present? && hora_inicio.min != 0
      errors.add(:hora_inicio, "Los minutos deben ser '00'")
    end

    if hora_fin.present? && hora_fin.min != 0
      errors.add(:hora_fin, "Los minutos deben ser '00'")
    end
  end

  def validar_horarios
    if hora_inicio.present? && (hora_inicio.hour < 8 || hora_inicio.hour >= 22 || hora_inicio.min != 0)
      errors.add(:hora_inicio, "Las reservas deben iniciarse entre las 8:00 a.m. y las 10:00 p.m., y en punto.")
    end

    if hora_fin.present? && (hora_fin.hour < 9 || hora_fin.hour > 22 || hora_fin.min != 0)
      errors.add(:hora_fin, "Las reservas deben finalizar entre las 9:00 a.m. y las 10:00 p.m., y en punto.")
    end
  end
end
