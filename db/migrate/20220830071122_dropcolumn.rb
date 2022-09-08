class Dropcolumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :names, :number
  end
end
