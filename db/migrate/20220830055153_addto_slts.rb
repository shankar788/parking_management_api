class AddtoSlts < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :slot_number, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
