class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.integer :pass_score
      t.integer :progress
      t.integer :score
      t.boolean :completed, null: false, default: false
      t.boolean :graduate,  null: false, default: false
      t.references :course, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
