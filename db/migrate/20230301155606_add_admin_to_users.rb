class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :admin, :boolean, null: false, default: false
    add_column :users, :avg_score, :integer
    add_column :users, :avg_progress, :integer
    add_column :users, :graduate, :boolean, null: false, default: false
  end
end
