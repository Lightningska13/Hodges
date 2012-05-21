class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name, :null => false
      t.string :item_number
      t.text :description
      t.integer :price
      t.string :pic_file_name
      t.integer :pic_file_size
      t.string :pic_content_type

      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end
