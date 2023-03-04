class StudentsController < ApplicationController
  def index
    @students = User.where(student: true)
    if current_user&.admin?
      CalculationsJob.perform_later
      flash[:notice] = 'Calculation started!'
      redis = Redis.new
      @total_score = redis.get('total_score')
    else
      redirect_to root_path, alert: 'You must be an admin to view this page.'
    end
  end
end
