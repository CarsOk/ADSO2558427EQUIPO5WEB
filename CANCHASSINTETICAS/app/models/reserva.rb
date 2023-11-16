class Reserva < ApplicationRecord
  belongs_to :usuario
  belongs_to :cancha
  validate :hora_y_dia_no_repetidos, on: :create
  validate :validar_minutos
  validate :validar_horarios
  before_save :calcular_duracion_y_precio, :calcular_estado

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

  def calcular_duracion_y_precio
    self.duracion_en_horas = calcular_duracion_en_horas
    self.precio = duracion_en_horas * cancha.precio if cancha.present?
  end

  def calcular_duracion_en_horas
    (hora_fin - hora_inicio).to_f / 1.hour
  end

  def hora_y_dia_no_repetidos
    if Reserva.exists?(cancha_id: cancha_id, fecha: fecha, hora_inicio: hora_inicio, hora_fin: hora_fin)
      errors.add(:base, "Ya hay una reserva para esta cancha en la misma hora y fecha.")
    end
  end

  def calcular_estado
    ahora = DateTime.now
      self.estado = if fecha == ahora.to_date
        'hoy'
      elsif fecha > ahora.to_date || (fecha == ahora.to_date && hora_inicio > ahora)
        'pendiente'
      else
        'pasado'
      end
  end
end
