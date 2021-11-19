class UsuariosController < ApplicationController
  layout 'layout_cliente'

  before_action :validar_sesion_redirigiendo_al_registro, only:[:mostrar, :cerrar_sesion, :actualizar]
  before_action :validar_sesion_para_el_registro, only:[:iniciar_sesion]
  

  def mostrar
  end

  # Patch / perfil
  def actualizar
    if @usuario_actual.update(params_usuario) # lo que hacíamos manual, lo hace en 1 sola línea
      flash[:actualizar_usuario] = "Datos actualizados"
      redirect_to usuario_path
    else
      render :mostrar
    end
  end

  #GET / iniciar_sesion
  def iniciar_sesion
    
  end

  #POST / iniciar_sesion
  def crear_sesion #Le pusimos crear sesión para iniciar porque se utiliza el método post para un usuario que ya existe
    usuario_encontrado = Usuario.find_by(num_identificacion: params[:num_identificacion])
    # byebug
    if usuario_encontrado # ¿el usuario existe?
      if usuario_encontrado.authenticate(params[:password])
        session[:usuario_id] = usuario_encontrado.id
        redirect_to root_path
      else
        #agregar mensaje de error
        flash[:clave_incorrecta] = "Clave incorrecta."
        render :iniciar_sesion
      end
    else
      flash[:usuario_incorrecto] = "El identificador de usuario no existe en nuestros registros."
      render :iniciar_sesion
    end
  end

  # DELETE / cerrar_sesion
  def cerrar_sesion
    session[:usuario_id] = nil
    redirect_to root_path
  end

  private
  def params_usuario
    return params.require(:usuario).permit(:nombre, :num_identificacion, :telefono, :password, :password_confirmation)
  end

end
