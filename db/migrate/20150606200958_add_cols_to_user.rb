class AddColsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :lat, :float
    add_column :users, :lng, :float
    add_column :users, :auth_token, :string
    add_column :users, :auth_secret, :string
  end
end
