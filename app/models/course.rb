class Course < ApplicationRecord
  belongs_to :user
  has_many :enrollments, dependent: :destroy
end
