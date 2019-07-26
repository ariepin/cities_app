class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.text :description
      t.integer :population
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longtitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
