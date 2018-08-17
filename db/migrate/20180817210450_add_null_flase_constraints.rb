class AddNullFlaseConstraints < ActiveRecord::Migration[5.1]
  def up
    change_column_null :cities, :name, false
    change_column_null :users, :full_name, false
  end

  def down
    change_column_null :cities, :name, true
    change_column_null :users, :full_name, true
  end
end
