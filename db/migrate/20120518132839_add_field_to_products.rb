class AddFieldToProducts < ActiveRecord::Migration
  def change
    add_column :products, :item_number, :string

  end
end
