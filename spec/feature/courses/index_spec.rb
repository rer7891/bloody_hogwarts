require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit /courses " do
    it " I see a list of courses and the number of students enrolled" do
      student_1 = Student.create!(name: "Hermoine",
                                  age: 7,
                                  house: "Gryfindor")
      student_2 = Student.create!(name: "Polly",
                                  age: 9,
                                  house: "Hufflepuff")
      student_3 = Student.create!(name: "Ron",
                                  age: 9,
                                  house: "Gryfindor")
      course_1 = Course.create!(name: "Defense Against the Dark Arts")
      course_2 = Course.create!(name: "Herbology")
      course_3 = Course.create!(name: "Magical Creatures")

      student_course_1 = StudentCourse.create(student_id: student_1.id, course_id: course_1.id)
      student_course_1 = StudentCourse.create(student_id: student_1.id, course_id: course_2.id)
      student_course_1 = StudentCourse.create(student_id: student_1.id, course_id: course_3.id)
      student_course_1 = StudentCourse.create(student_id: student_2.id, course_id: course_1.id)
      student_course_1 = StudentCourse.create(student_id: student_3.id, course_id: course_1.id)
      student_course_1 = StudentCourse.create(student_id: student_3.id, course_id: course_3.id)
      visit '/courses'

      expect(page).to have_content("Defense Against the Dark Arts has 3 students.")
      expect(page).to have_content("Herbology has 1 students.")
      expect(page).to have_content("Magical Creatures has 2 students.")

    end
  end
end
