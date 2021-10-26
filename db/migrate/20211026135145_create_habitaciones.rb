class CreateHabitaciones < ActiveRecord::Migration[6.1]
  def change
    create_table :habitaciones do |t|
      t.string :nombre
      t.integer :precio
      t.boolean :estado_reserva
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
