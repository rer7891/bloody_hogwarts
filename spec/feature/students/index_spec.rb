require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit /students" do
    it "I see a list of students will all details listed" do
      student_1 = Student.create!(name: "Hermoine",
                                  age: 7,
                                  house: "Gryfindor")
      student_2 = Student.create!(name: "Polly",
                                  age: 9,
                                  house: "Hufflepuff")

      visit '/students'

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_1.age)
      expect(page).to have_content(student_1.house)

      expect(page).to have_content(student_2.name)
      expect(page).to have_content(student_2.age)
      expect(page).to have_content(student_2.house)
    end
  end
end
