class Student < ApplicationRecord
  belongs_to :user

  def self.to_csv
    attributes = %w[email name avg_score avg_progress graduate]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map { |attr| user.send(attr) }
      end
    end
  end
end
