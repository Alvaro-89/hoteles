class CiudadesController < ApplicationController

  def listar
    @lista_ciudades = Ciudad.all
  end

  def mostrar_formulario_crear
    @ciudad = Ciudad.new
  end

  def guardar
    #Extraer los datos del formulario:
    datos_formulario =  params.require(:ciudad).permit(:nombre)#Esto forma un hash

    #Guardando los datos💾
    @ciudad = Ciudad.new
    @ciudad.nombre = datos_formulario[:nombre]

    if @ciudad.save
      #Mostrar la confirmación:
      # redirect_to "/ciudades"
      redirect_to ciudades_path
    else
      render :mostrar_formulario_crear
    end
  end

end