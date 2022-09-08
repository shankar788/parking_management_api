class Aasas < ActiveRecord::Migration[7.0]
  def change
    change_column :slots, :in_time, :datetime
    change_column :slots, :out_time, :datetime
  end

end
