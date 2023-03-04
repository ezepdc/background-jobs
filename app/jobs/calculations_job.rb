class CalculationsJob < ApplicationJob
  queue_as :default

  def perform
    puts "Starting calculations"

    total_score = Enrollment.sum(:score) + 3

    redis = Redis.new
    redis.set('total_score', total_score)

    puts "Calculations done, total score is #{total_score}"
  end
end
