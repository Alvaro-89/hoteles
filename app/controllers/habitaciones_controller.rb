class HabitacionesController < ApplicationController

  before_action :asignar_habitacion, only: [:mostrar, :editar, :actualizar, :eliminar]

  # GET / habitaciones
  def listar
    @habitaciones = Habitacion.all
  end

  # GET / habitaciones / nuevo
  def nuevo
    @habitacion = Habitacion.new
    @hoteles = Hotel.all
    @texto_boton = "Crear Hotel"

    if params[:hotel_id]
      @habitacion.hotel_id = params[:hotel_id]
    end
  end

  # GET / habitaciones / :id / nuevo
  def editar
    @hoteles = Hotel.all
    @texto_boton = "Actualizar Habitación"
  end

  #GET / habitaciones / :id
  def mostrar
    
  end

  #POST / habitaciones
  def guardar
    
    @habitacion = Habitacion.new(params_habitacion)

    if @habitacion.save
      redirect_to habitaciones_path
    else
      @hoteles = Hotel.all
      @texto_boton = "Registrar Habitación"
      render :nuevo
    end
  end

  # PATCH / habitaciones / :id
  def actualizar
    @habitacion.nombre          = params_habitacion[:nombre]
    @habitacion.precio          = params_habitacion[:precio]
    @habitacion.estado_reserva  = params_habitacion[:estado_reserva]
    @habitacion.hotel_id        = params_habitacion[:hotel_id]
    @habitacion.fotos_habitacion = params_habitacion[:fotos_habitacion]

    if @habitacion.save
      redirect_to habitaciones_path
    else
      @hoteles = Hotel.all
      @texto_boton = "Actualizar habitación desde actualizar"
      render :editar
    end
  end

  # DELETE / habitaciones / :id
  def eliminar
    @habitacion.destroy
    redirect_to habitaciones_path
  end


  private

  def asignar_habitacion
    @habitacion = Habitacion.find_by(id: params[:id])
  end

  def params_habitacion
    return params.require(:habitacion).permit(:nombre, :precio, :estado_reserva, :hotel_id, fotos_habitacion: [])
  end
end
