class AddtoSlotUSerRef < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :user_id, :integer
  end
end
