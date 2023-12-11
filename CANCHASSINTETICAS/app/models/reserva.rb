class Reserva < ApplicationRecord
  #Asociaciones
  belongs_to :usuario
  belongs_to :cancha

  default_scope { order(:id) }

  validate :validar_horarios
  validate :hora_y_dia_no_repetidos, on: :create
  validate :validar_minutos
  validate :hora_inicio_no_igual_a_hora_fin, on: :create
  validate :reserva_no_editable_despues_de_finalizado, on: :update
  before_save :calcular_duracion_y_precio, :calcular_estado
  before_save :ajustar_precio
  before_validation :validar_fecha_reserva, on: :create

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

  def fecha_recordatorio
    # Aquí puedes personalizar la lógica según tus necesidades
    # En este ejemplo, estamos asumiendo que el recordatorio se enviará un día antes de la fecha de la reserva
    fecha - 1.day
  end

  #Metodos
  private
  # Fecha 
  def validar_horarios
    if hora_inicio.present? && (hora_inicio.hour < 8 || hora_inicio.hour >= 22 || hora_inicio.min != 0)
      errors.add(:hora_inicio, "Las reservas deben iniciarse entre las 8:00 a.m. y las 10:00 p.m., y en punto.")
    end

    if hora_fin.present? && (hora_fin.hour < 9 || hora_fin.hour > 22 || hora_fin.min != 0)
      errors.add(:hora_fin, "Las reservas deben finalizar entre las 9:00 a.m. y las 10:00 p.m., y en punto.")
    end
  end

  def hora_y_dia_no_repetidos
    if Reserva.exists?(cancha_id: cancha_id, fecha: fecha, hora_inicio: hora_inicio, hora_fin: hora_fin)
      errors.add(:base, "Ya hay una reserva para esta cancha en la misma hora y fecha.")
    end
  end

  def calcular_estado
    ahora = DateTime.now

    self.estado = if fecha == ahora.to_date 
                    '<span class="label label-warning-estado">Actualmente</span>'.html_safe
                  elsif fecha > ahora.to_date || (fecha == ahora.to_date && hora_inicio > ahora)
                    '<span class="label label-info-estado">En proceso</span>'.html_safe
                  else
                    '<small class="label label-danger-estado">finalizado</small>'.html_safe
                  end

    puts "Calculated estado: #{self.estado}"
  end
   
  public :calcular_estado
  
  # Minutos = 00
  def validar_minutos
    if hora_inicio.present? && hora_inicio.min != 0
      errors.add(:hora_inicio, "Los minutos deben ser '00'")
    end

    if hora_fin.present? && hora_fin.min != 0
      errors.add(:hora_fin, "Los minutos deben ser '00'")
    end
  end

  def hora_inicio_no_igual_a_hora_fin
    if hora_inicio == hora_fin
      errors.add(:base, "La hora de inicio no puede ser igual a la hora de fin.")
    end
  end


 def calcular_duracion_y_precio
    self.duracion_en_horas = calcular_duracion_en_horas
    self.precio = ajustar_precio
  end

  def calcular_duracion_en_horas
    (hora_fin - hora_inicio).to_f / 1.hour
  end

  def ajustar_precio
    precio_base_cancha = cancha.precio

    if fecha.saturday? || fecha.sunday?
      duracion_en_horas * (precio_base_cancha + 10000)
    else
      duracion_en_horas * precio_base_cancha
    end
  end

  def reserva_no_editable_despues_de_finalizado
    if estado == '<small class="label label-danger-estado">finalizado</small>'.html_safe
      errors.add(:base, "No se puede editar una reserva después de que ha sido finalizada.")
    end
  end

  def cancelable?
    # Verificar si la reserva se puede cancelar un día antes de la fecha
    # Por ejemplo, si la fecha de reserva es mañana o después, puede cancelarse hoy.
    fecha_reserva >= Date.current + 1.day
  end


  def validar_fecha_reserva
    ahora = DateTime.now

    if fecha.present? && (fecha < ahora.to_date || (fecha == ahora.to_date && hora_inicio <= ahora.strftime('%H:%M:%S')))
      errors.add(:fecha, 'La fecha seleccionada no es valida')
    end
  end

end
