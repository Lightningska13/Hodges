class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :eventpic_file_name, :string

    add_column :events, :eventpic_file_size, :integer

    add_column :events, :eventpic_content_type, :string

  end
end
