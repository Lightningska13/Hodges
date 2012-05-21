class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :pic2_file_name, :string

    add_column :products, :pic2_file_size, :integer

    add_column :products, :pic2_content_type, :string

  end
end
