class StudentsController < ApplicationController
  def index
    @students = User.where(student: true)
    @last_update = Enrollment.last.updated_at
  end

  def calculations
    if current_user&.admin?
      CalculationsJob.perform_later
      flash[:notice] = 'Calculation started!'
      redirect_to students_index_path
    else
      redirect_to root_path, alert: 'You must be an admin to view this page.'
    end
  end
end
