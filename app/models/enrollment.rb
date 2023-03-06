class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student
  belongs_to :user
end
