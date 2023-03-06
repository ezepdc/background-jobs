class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.integer :avg_score
      t.integer :avg_progress
      t.boolean :graduate, null: false, default: false
      t.datetime :last_calculation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
