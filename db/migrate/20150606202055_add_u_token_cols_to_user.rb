class AddUTokenColsToUser < ActiveRecord::Migration
  def change
    add_column :users, :uauth_token, :string
  end
end
