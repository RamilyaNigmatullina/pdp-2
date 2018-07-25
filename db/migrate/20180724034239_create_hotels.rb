class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.float :rating, null: false, default: 0
      t.integer :stars, null: false, default: 1
    end
  end
end
