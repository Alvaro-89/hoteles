class PaginasController < ApplicationController

  layout 'layout_cliente' #Definiendo el layout a utilizar

  def principal
    
    if params[:busqueda]
      puts "Buscando #{params[:busqueda]}".center(35,"🔎")
    end

  end

end