class RenameColors2InProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :colour, :color
  end
end
