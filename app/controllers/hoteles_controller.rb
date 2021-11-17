class HotelesController < ApplicationController

  before_action :asignar_hotel, only: [:mostrar, :editar, :actualizar, :eliminar]

  #GET / hoteles
  def listar
    @hoteles = Hotel.all
  end

  #GET / nuevo / hoteles
  def nuevo
    @hotel = Hotel.new
    @ciudades = Ciudad.all #Creamos esta variable para hacer la consulta a la base de datos.
    @texto = "Crear Hotel"

    if params[:id_ciudad]
      @hotel.ciudad_id = params[:id_ciudad]
    end
  end

  #get / hoteles / :id / editar
  def editar
    @ciudades = Ciudad.all
    @texto = "Actualizar Hotel"
  end

  def mostrar
  end

  #POST / hoteles
  def guardar
    # @hotel = Hotel.new
    # @hotel.nombre = params_hotel[:nombre]
    # @hotel.estrellas = params_hotel[:estrellas]
    # @hoteles.ciudad_id = params_hotel[:ciudad]
    @hotel = Hotel.new(params_hotel)

    if @hotel.save
      redirect_to hoteles_path # listar hoteles
    else
      @ciudades = Ciudad.all
      render :nuevo
    end
  end

  # PATCH /hoteles/:id
  def actualizar
    @hotel.nombre = params_hotel[:nombre]
    @hotel.estrellas = params_hotel[:estrellas]
    @hotel.ciudad_id = params_hotel[:ciudad_id]
    @hotel.foto_portada = params_hotel[:foto_portada]
    if @hotel.save
      redirect_to hoteles_path
    else
      @ciudades = Ciudad.all
      @texto = "Actualizar hotel desde actualizar"
      render :editar
    end
  end

  def eliminar
    @hotel.destroy
    redirect_to hoteles_path

  rescue
    flash[:error_hotel] = "no se puede eliminar el hotel #{@hotel.nombre} porque existe una habitación asociada a él"
    redirect_to hoteles_path
  end

  private

  def asignar_hotel
    @hotel = Hotel.find_by(id: params[:id])
  end

  def params_hotel
    return params.require(:hotel).permit(:nombre, :estrellas, :ciudad_id, :foto_portada)
  end
end
