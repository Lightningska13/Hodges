class CreateProductCats < ActiveRecord::Migration
  def change
    create_table :product_cats do |t|
      t.string :cat_name
      t.string :catpic_file_name
      t.integer :catpic_file_size
      t.string :catpic_content_type
      t.boolean :featured
      t.text :description

      t.timestamps
    end
  end
end
