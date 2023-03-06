require 'csv'

class StudentsController < ApplicationController
  before_action :set_last_update, only: :index
  before_action :require_admin, only: :calculations

  def index
    @students = Student.all
  end

  def calculations
    CalculationsJob.perform_later
    redirect_to students_index_path,
      notice: 'Los cálculos se están realizando, por favor aguardar 10 segundos y refrescar la página.'
  end

  def upload_students
    upload_csv('students', ['name', 'email']) do |row|
      Student.create!(
        name: row[1],
        email: row[2],
        user: current_user
      )
    end
  end

  def upload_courses
    upload_csv('courses', ['title']) do |row|
      Course.create!(
        title: row[1],
        user: current_user
      )
    end
  end

  def upload_enrollments
    upload_csv('enrollments', ['course_id', 'student_id', 'pass_score', 'progress', 'score']) do |row|
      Enrollment.create!(
        course_id: row[1],
        student_id: row[2],
        pass_score: row[3],
        progress: row[4],
        score: row[5],
        user: current_user
      )
    end
  end

  def export_students_csv
    @students = Student.all.select(:email, :name, :avg_score, :avg_progress, :graduate)

    respond_to do |format|
      format.csv { send_data Student.to_csv, filename: "students-#{Date.today}.csv" }
    end
  end

  private

  def set_last_update
    last_calculation = Student.order(last_calculation: :desc).first
    @last_update = last_calculation&.last_calculation
  end

  def require_admin
    redirect_to root_path, alert: 'Debes ser administrador para ver esta página.' unless current_user&.admin?
  end

  def upload_csv(name, headers)
    csv_file = params[:file]

    if csv_file.present?
      CSV.foreach(csv_file.path, headers: headers) do |row|
        yield(row)
      end
      redirect_to root_path, alert: "#{name.capitalize} se han agregado correctamente."
    else
      redirect_to root_path, alert: 'No se ha encontrado un archivo CSV.'
    end
  end
end
