require 'csv'

class StudentsController < ApplicationController
  def index
    @students = User.where(student: true)
    @last_update = Enrollment.order(updated_at: :desc).first.updated_at
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

  def upload_csv
    csv_file = params[:file]
    headers = ['course_id', 'user_id', 'pass_score', 'progress', 'score']
    CSV.foreach(csv_file.path, headers: headers) do |row|
      Enrollment.create!(
        course_id: row[1],
        user: User.find(row[2]),
        pass_score: row[3],
        progress: row[4],
        score: row[5]
      )
    end
    redirect_to root_path, alert: 'CSV file was successfully uploaded.'
  end

  def export_students_csv
    @students = User.where(student: true).select(:email, :name, :avg_score, :avg_progress, :graduate)

    respond_to do |format|
      format.csv { send_data User.to_csv, filename: "students-#{Date.today}.csv" }
    end
  end
end
