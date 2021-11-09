class Habitacion < ApplicationRecord
  belongs_to :hotel
  has_many :reservas
  has_many :usuarios, through: :reservas

  validates :nombre, presence: true
  validates :nombre, uniqueness: true

end
