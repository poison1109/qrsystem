class AddProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :corporation, :string
    add_column :users, :owner, :string
    add_column :users, :admin_flag, :integer
  end
end
