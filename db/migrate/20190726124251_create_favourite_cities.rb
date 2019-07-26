class CreateFavouriteCities < ActiveRecord::Migration[5.2]
  def change
    create_table :favourite_cities do |t|
      t.belongs_to :user, index: true
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end
