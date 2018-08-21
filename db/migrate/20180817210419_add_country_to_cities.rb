class AddCountryToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :country, :string, null: false, default: "Russian Federation"
  end
end
