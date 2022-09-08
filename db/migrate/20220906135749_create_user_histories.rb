class CreateUserHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :user_histories do |t|
      t.string :car_number
      t.string :car_color
      t.string :in_time
      t.string :out_time
      t.string :status
      t.decimal :price
      t.integer :floor_id
      t.integer :user_id
      t.string :slot_number

      t.timestamps
    end
  end
end
