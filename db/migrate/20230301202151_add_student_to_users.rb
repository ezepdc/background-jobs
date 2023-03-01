class AddStudentToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :student, :boolean, null: false, default: false
  end
end
