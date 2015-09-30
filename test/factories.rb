FactoryGirl.define do

  factory :user do
    sequence :email do |n|
              "timinki#{n}@gmail.com"
    end
    password              "123456789"
    password_confirmation "123456789"
  end

  factory :course do
    title "Test Course"
    description "This line describes what the course is about."
    cost 0
    association :user
  end

  factory :section do
    title "Test Section"
    association :user
    association :course
  end

  factory :lesson do
    title "Test Lesson"
    subtitle "Subtitle"
    association :user
    association :course
    association :section
  end

end
