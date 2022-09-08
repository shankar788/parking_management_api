class AddtoUSer < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string, :default => "user"
    add_column :users, :name, :string
  end
end
