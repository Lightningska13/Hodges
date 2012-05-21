class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :event_type
      t.date :start_date
      t.date :end_date
      t.string :title
      t.text :blurb
      t.text :description
      t.string :url
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
