class Ciudad < ApplicationRecord
  before_validation   :capitalizar_nombre
  after_validation    :despues_de_validar
  before_save         :antes_de_guardar
  after_save          :despues_de_guardar

  before_destroy      :antes_de_destuir
  after_destroy       :despues_de_destruir

  has_many :hoteles # una ciudad tiene muchos hoteles

  # has_many :hoteles hoteles, dependent: :destroy --> Al eliminar una ciudad elimina todos los hoteles asociados a esa ciudad.

  validates :nombre, presence: true
  validates :nombre, uniqueness: true

  private
  def capitalizar_nombre
      self.nombre = self.nombre.split(" ").map(&:capitalize).join(" ") 
      #El split separa el texto por los espacios.
      #El .map se usa para convertir un elemento dentro de un arreglo (a diferencia del .each que sirve para hacer algo con cada elemento)
      # &:capitalize es una forma rápida de escribir un bloque con iterador
      # join une los elementos de un arreglo. Si le ponemos un valor entre los paréntesis atecederá cada elemento con un ese valor, excepto el primero y el último.
      puts "ANTES DE VALIDAR 🍕"
  end

  def despues_de_validar
      puts "DESPUES DE VALIDAR 🍔"
  end

  def antes_de_guardar
      puts "ANTES DE GUARDAR 🍟"
  end

  def despues_de_guardar
      puts "DESPUES DE GUARDAR 🌭"
  end

  def antes_de_destuir
      puts "ANTES DE DESTRUIR 🍿"
  end

  def despues_de_destruir
      puts "DESPUES DE DESTRUIR 🧂"
  end
end