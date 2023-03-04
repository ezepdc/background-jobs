class CalculationsJob < ApplicationJob
  queue_as :default

  def perform
    puts "***********Starting calculations************"

    Enrollment.all.each do |e|
      e.completed = e.progress == 100
      e.graduate = e.completed && e.score > e.pass_score
      e.save
      puts "********* Progress: #{e.progress} Completed: #{e.completed} Gradaute: #{e.graduate}*********"
    end

    puts "************Completed***********"
  end
end
