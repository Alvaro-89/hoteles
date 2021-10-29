class Ciudad < ApplicationRecord
  has_many :hoteles
  
  validates :nombre, presence: true
  validates :nombre, uniqueness: true

end
