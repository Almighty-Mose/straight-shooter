class User < ApplicationRecord
  # has_secure_password
  belongs_to :location
  has_many :student_meetings, foreign_key: :teacher_id, class_name: "Meeting"
  has_many :students, through: :student_meetings, source: :student
  has_many :teacher_meetings, foreign_key: :student_id, class_name: "Meeting"
  has_many :teachers, through: :teacher_meetings, source: :teacher
  has_many :meetings
end
