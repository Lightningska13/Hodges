class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :null => false
      t.string :name, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.string :perishable_token, :null => false
      t.integer :login_count, :null => false, :default => 0
      t.integer :failed_login_count, :null => false, :default => 0
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.string :current_login_ip
      t.string :last_login_ip
      t.integer :admin_level, :default=>5

      t.timestamps
    end
    User.create  :login=>"patrick", :name=>"Patrick Lighthall", :admin_level=>"10", :password=>"patrick1", :password_confirmation=>"patrick1"
  end

  def self.down
    drop_table :users 
  end
end
