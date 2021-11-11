class RegistrosController < ApplicationController
  
  def guardar
    @usuario = Usuario.new(params_usuario)
    @usuario.rol = Rol.find_by(rol: 'Cliente')
    if @usuario.save
      redirect_to root_path
    end
  end

  private
  def params_usuario
    return params.require(:usuario).permit(:nombre, :num_identificacion, :telefono, :password, :password_confirmation)
  end

end