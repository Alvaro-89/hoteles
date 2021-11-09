class Rol < ApplicationRecord
  has_many :usuarios

  before_validation :capitalizar_rol

  validates :rol, presence: true
  validates :rol, uniqueness: true

  def capitalizar_rol
    self.rol = self.rol.split(" ").map(&:capitalize).join(" ") 
    #El split separa el texto por los espacios.
    #El .map se usa para convertir un elemento dentro de un arreglo (a diferencia del .each que sirve para hacer algo con cada elemento)
    # &:capitalize es una forma rápida de escribir un bloque con iterador
    # join une los elementos de un arreglo. Si le ponemos un valor entre los paréntesis atecederá cada elemento con un ese valor, excepto el primero y el último.
    puts "ANTES DE VALIDAR 🍕"
  end

end
