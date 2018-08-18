class AddCheckInTimeToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :check_in_time, :datetime
  end
end
