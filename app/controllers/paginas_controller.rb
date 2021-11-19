class PaginasController < ApplicationController

  layout 'layout_cliente' #Definiendo el layout a utilizar

  before_action :validar_sesion_sin_redirigir #Método traído desde application_controller

  def principal
    # Recuperando todos mis hoteles en la base de datos
    @hoteles_encontrados = Hotel.includes(:ciudad).shuffle
    @ciudades_encontradas = Ciudad.all
    
    if params[:busqueda]
      # Filtrarlos utilizando select
      @hoteles_encontrados = @hoteles_encontrados.select do |h|
        h.nombre.downcase.include? params[:busqueda].downcase
      end
      #Esto lo que hace es reasignar la variable y guarda los hoteles encontrados cuyo valor coincida con la búsqueda(ya no son todos los hoteles sino que una selección)

      @ciudades_encontradas = @ciudades_encontradas.select do |ci|
        ci.nombre.downcase.include? params[:busqueda].downcase
      end
    end

  end

  #get / paginas / :id_hotel
  def info_hotel
    # recuperar el :id_hotel que llega desde los params
    id = params[:id_hotel]
    # buscar el hotel utilizando el modelo Hotel
    @hotel_encontrado = Hotel.find(id) # El método find() busca por el id (y solo por el id) de una tabla.
    # controlar si el ID no existe

  rescue
    redirect_to root_path
  end

  #get / paginas / ciudades / :id_ciudad
  def info_ciudad
    id = params[:id_ciudad]

    @ciudad_encontrada = Ciudad.find(id)

  rescue
    redirect_to root_path
  end

end