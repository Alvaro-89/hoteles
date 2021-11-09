class CiudadesController < ApplicationController

  before_action :asignar_ciudad, only: [:mostrar, :editar, :actualizar, :eliminar]


  # GET / ciudades
  def listar
    @lista_ciudades = Ciudad.all
  end

  # GET / ciudades / nuevo
  def mostrar_formulario_crear
    @ciudad = Ciudad.new
  end

  # GET / ciudades / :id / editar
  def editar
  end

  #GET / ciudades / :id
  def mostrar
  end

  # POST / ciudades
  def guardar
    #Extraer los datos del formulario:
    datos_formulario = params_ciudad #se iguala al método del private 👇

    #Guardando los datos💾
    @ciudad = Ciudad.new
    @ciudad.nombre = params_ciudad[:nombre]

    if @ciudad.save
      #Mostrar la confirmación:
      # redirect_to "/ciudades"
      redirect_to ciudades_path
    else
      render :mostrar_formulario_crear
    end
  end

  #PATCH / ciudades / :id
  def actualizar
    datos_formulario = params_ciudad
    @ciudad.nombre = params_ciudad[:nombre]
    if @ciudad.save
      redirect_to ciudades_path
    else
      render :editar
    end
  end

  # DELETE / ciudades / :id
  def eliminar
    @ciudad.destroy
    redirect_to ciudades_path
  rescue #Si uno no pone el nombre del error, corre para cualquier error
    flash[:error_ciudad] = "No se puede elminar la ciudad, porque hay hoteles registrados"
    redirect_to ciudades_path
  end


  private # todo lo que esté desde esta línea hacia abajo va a ser privado.

  def asignar_ciudad
    #extraer el :id de la URL con params[:id]
    @ciudad = Ciudad.find_by(id: params[:id]) #Este código estaba anteriormente en los métodos editar, actualizar y eliminar. Para no repetir el código y evitar errores, se pasan a un único método que se aplica antes de ciertos métodos específicos (before_action).
    puts "Antes 🚥".center(50, "*")
  end

  def params_ciudad
    return params.require(:ciudad).permit(:nombre) #Esto forma un hash
  end
  
end