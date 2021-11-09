class Hotel < ApplicationRecord
  belongs_to :ciudad
  has_many :habitaciones

  before_validation   :capitalizar_nombre

  validates :nombre, presence: true
  validates :estrellas, presence: true
  validates :ciudad_id, presence: true

  private

  def capitalizar_nombre
    self.nombre = self.nombre.split(" ").map(&:capitalize).join(" ") 
    #El split separa el texto por los espacios.
    #El .map se usa para convertir un elemento dentro de un arreglo (a diferencia del .each que sirve para hacer algo con cada elemento)
    # &:capitalize es una forma rápida de escribir un bloque con iterador
    # join une los elementos de un arreglo. Si le ponemos un valor entre los paréntesis atecederá cada elemento con un ese valor, excepto el primero y el último.
    puts "ANTES DE VALIDAR 🍕"
  end
end
