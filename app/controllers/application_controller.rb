class ApplicationController < ActionController::Base

  # Se cambiaron todas las cookies por session***
  
  def validar_sesion_sin_redirigir
    if session[:usuario_id]
      @usuario_actual = Usuario.find(session[:usuario_id]) #recordar que el "find" busca por id.
    end
  rescue
    session[:usuario_id] = nil
    @usuario_actual = nil
  end

  def validar_sesion_redirigiendo_al_registro
    if session[:usuario_id]
      @usuario_actual = Usuario.find(session[:usuario_id]) #recordar que el "find" busca por id.
    else
      redirect_to registro_path
    end
  rescue
    session.delete(:usuario_id)
    redirect_to registro_path
  end

  def validar_sesion_para_el_registro
    if session[:usuario_id]
      @usuario_actual = Usuario.find(session[:usuario_id])
      redirect_to root_path
    else
      @usuario_actual = nil
    end
  end

  def validar_sesion_administrador
  if session[:usuario_id]                                         # 1. preguntamos por la sesión
    @usuario_actual = Usuario.find(session[:usuario_id])        # 2. buscamos el usuario en la base de datos
    if @usuario_actual.rol != Rol.find_by(rol: 'Administrador') # 3. preguntamos si es diferente al administrador para devolverlo a la raíz
      redirect_to root_path
    end
  else
    redirect_to root_path
  end
  rescue
    session[:usuario_id] = nil
    redirect_to root_path
  end

end
