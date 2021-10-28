#Esto tiene que ir necesariamente con el mismo nombre del modelo pero con mayúscula
class RolesController < ApplicationController
  def crear
    #Este método busca mostrar formulario para guardar roles nuevos.

    #GET / roles / nuevo
    @mi_nombre = "Álvaro González"
    @rol = Rol.new
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
      #tomar prestada una vista
    end
  end

  #GET /roles
  def listar
    @roles = Rol.all
  end

end