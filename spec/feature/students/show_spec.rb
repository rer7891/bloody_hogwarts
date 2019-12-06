require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit /students" do
    it "I see a list of student courses" do

      course_1 = Course.create!(name: "Defense Against the Dark Arts")
      course_2 = Course.create!(name: "Herbology")
      course_3 = Course.create!(name: "Magical Creatures")


      student_1= Student.create!(name: "Hermoine",
                                  age: 7,
                                  house: "Gryfindor")

      student_course_1 = StudentCourse.create(student_id: student_1.id, course_id: course_1.id)
      student_course_1 = StudentCourse.create(student_id: student_1.id, course_id: course_2.id)
      student_course_1 = StudentCourse.create(student_id: student_1.id, course_id: course_3.id)

     visit "/students/#{student_1.id}"

     expect(page).to have_content(course_1.name)
     expect(page).to have_content(course_2.name)
     expect(page).to have_content(course_3.name)
    end
  end
end
