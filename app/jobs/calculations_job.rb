class CalculationsJob < ApplicationJob
  queue_as :default

  def perform
    puts "**********Starting calculations**********"

    calculate_courses_enrollment
    calculate_platforms_student

    puts "**********Completed**********"
  end

  private

  def calculate_courses_enrollment
    puts "**********Starting COURSES calculations**********"

    Enrollment.all.each do |enrollment|
      enrollment.completed = enrollment.progress == 100
      enrollment.graduate = enrollment.completed && enrollment.score > enrollment.pass_score
      enrollment.save

      puts "********** Progress: #{enrollment.progress} Completed: #{enrollment.completed} Gradaute: #{enrollment.graduate} **********"
    end
  end

  def calculate_platforms_student
    puts "**********Starting PLATFORMS calculations**********"

    Student.all.each do |student|
      student.avg_score = Enrollment.where(student_id: student.id).average(:score)
      student.avg_progress = Enrollment.where(student_id: student.id).average(:progress)

      enrollments = Enrollment.where(student_id: student.id)
      student.graduate = enrollments.present? ? enrollments.pluck(:graduate).all? : false

      student.last_calculation = Time.now
      student.save

      puts "********** Student #{student.id} #{student.name} Average Score: #{student.avg_score} Average Progress #{student.avg_progress} Graduate #{student.graduate} **********"
    end
  end
end
