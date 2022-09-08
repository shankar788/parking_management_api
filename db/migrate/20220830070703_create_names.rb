class CreateNames < ActiveRecord::Migration[7.0]
  def change
    create_table :names do |t|
      t.string :add
      t.string :number
      t.string :demo
      t.references :user, null: false, foreign_key: true
      t.references :floor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
