class HabitacionesController < ApplicationController


# GET / habitaciones
def listar
  @habitaciones = Habitacion.all
end


end
