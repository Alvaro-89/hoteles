#Esto tiene que ir necesariamente con el mismo nombre del modelo pero con mayúscula
class RolesController < ApplicationController
  
  before_action :asignar_rol, only: [:editar, :actualizar, :eliminar]

  #GET /roles
  def listar #READ
    @roles = Rol.all
  end

  # GET / roles / nuevo
  def crear #CREATE
    #Este método busca mostrar formulario para guardar roles nuevos.

    #GET / roles / nuevo
    @rol = Rol.new
  end

  #GET / roles / :id / editar
  def editar #UPDATE
    
  end

  #POST / roles
  def guardar
    #Extraer los datos del params
    datos_rol = params.require(:rol).permit(:rol)
    # asignando lso datos a un nuevo rol
    @nuevo_rol = Rol.new(datos_rol)
    if @nuevo_rol.save
      #por verdad mostrar algo
      redirect_to roles_path
    else
      render :nuevo #tomar prestada una vista
    end
  end

  #Patch / roles / :id
  def actualizar
    datos_formulario = params_rol
    @rol.rol = params_rol[:rol]
    if @rol.save
      redirect_to roles_path
    else
      render :editar
    end
  end

  # delete / roles / :id
  def eliminar
    @rol.destroy
    redirect_to roles_path
  end

  private

  def asignar_rol
    @rol = Rol.find_by(id: params[:id])
  end

  def params_rol
    return params.require(:rol).permit(:rol)
  end
end