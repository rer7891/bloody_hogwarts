class Student <ApplicationRecord
  validates_presence_of :name, :age, :house
  has_many :student_courses
  has_many :courses, through: :student_courses

  def ave_age
    Student.average(:age).round
  end
end
