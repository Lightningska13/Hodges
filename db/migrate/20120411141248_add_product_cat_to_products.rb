class AddProductCatToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_cat_id, :integer

  end
end
