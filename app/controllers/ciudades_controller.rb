class CiudadesController < ApplicationController

  def listar
    @ciudades = Ciudad.all
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
    @ciudad.save
    
    #Mostrar la confirmación:
    puts "GUARDADO".center(20,"*")
  end

end