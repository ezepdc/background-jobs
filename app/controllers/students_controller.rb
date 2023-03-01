class StudentsController < ApplicationController
  def index
    @students = User.where(student: true)
  end
end
