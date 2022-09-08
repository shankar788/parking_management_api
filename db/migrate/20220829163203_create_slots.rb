class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.string :car_number
      t.string :car_color
      t.string :in_time
      t.string :out_time
      t.string :status
      t.decimal :price
      t.references :floor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
