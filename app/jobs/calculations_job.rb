class CalculationsJob < ApplicationJob
  queue_as :default

  def perform
    puts "***********Starting calculations************"

    puts "***********Starting COURSES calculations************"

    Enrollment.all.each do |e|
      e.completed = e.progress == 100
      e.graduate = e.completed && e.score > e.pass_score
      e.save
      puts "********* Progress: #{e.progress} Completed: #{e.completed} Gradaute: #{e.graduate}*********"
    end

    puts "***********Starting PLATFORMS calculations************"

    User.all.each do |u|
      u.avg_score = Enrollment.where(user: u.id).average(:score)
      u.avg_progress = Enrollment.where(user: u.id).average(:progress)
      enrollments = Enrollment.where(user: u.id)
      u.graduate = enrollments.present? ? enrollments.pluck(:graduate).all? : false
      u.save
      puts "****** User #{u.id} #{u.name} Average Score: #{u.avg_score} Average Progress #{u.avg_progress} Graduate #{u.graduate}*****"
    end

    puts "************Completed***********"
  end
end
