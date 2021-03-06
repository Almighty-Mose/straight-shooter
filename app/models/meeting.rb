class Meeting < ApplicationRecord
  belongs_to :location
  belongs_to :teacher, foreign_key: "teacher_id", class_name: "User"
  belongs_to :student, foreign_key: "student_id", class_name: "User"
  has_many :students
end
