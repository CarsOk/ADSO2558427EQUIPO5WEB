class Reserva < ApplicationRecord 
  belongs_to :usuario
  belongs_to :cancha
  default_scope { order(:id) }
  validate :hora_y_dia_no_repetidos, on: :create
  validate :validar_minutos
  validate :validar_horarios
  validate :hora_inicio_no_igual_a_hora_fin, on: :create
  before_save :calcular_duracion_y_precio, :calcular_estado

  def cumple_restricciones_horario?
    return false if hora_inicio.present? &&
                    (hora_inicio.hour < 8 || hora_inicio.hour >= 22 || hora_inicio.min != 0)
    return false if hora_fin.present? &&
                    (hora_fin.hour < 9 || hora_fin.hour > 22 || hora_fin.min != 0)
    return false if hora_inicio == hora_fin
    true
  end

  def actualizar_estado
    calcular_estado
    save!
  end

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

  def calcular_estado_con_estilo
    ahora = DateTime.now

    # Lógica para asignar el estado con estilo
    self.estado = if fecha == ahora.to_date 
                    '<span class="label label-warning-estado">Actualmente</span>'.html_safe
                  elsif fecha > ahora.to_date || (fecha == ahora.to_date && hora_inicio > ahora)
                    '<span class="label label-info-estado">En proceso</span>'.html_safe
                  else
                    '<small class="label label-danger-estado">finalizado</small>'.html_safe
                  end
  end
   
  public :calcular_estado_con_estilo
  def hora_inicio_no_igual_a_hora_fin
    if hora_inicio == hora_fin
      errors.add(:base, "La hora de inicio no puede ser igual a la hora de fin.")
    end
  end

end
