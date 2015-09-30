require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  test "Validates title is present" do
    course = FactoryGirl.build(:course, :title => "")
    is_valid = course.valid?
    assert_equal false, is_valid
  end

  test "Validates description is present" do
    course = FactoryGirl.build(:course, :description => "")
    is_valid = course.valid?
    assert_equal false, is_valid
  end

  test "Validates price is >= 0" do
    course = FactoryGirl.build(:course, :cost => -1)
    is_valid = course.valid?
    assert_equal false, is_valid
  end

  test "Course displays free if tuition 0" do
    course = FactoryGirl.create(:course, :cost =>0)
    assert_equal true, course.free?

    course = FactoryGirl.create(:course, :cost =>1)
    assert_equal false, course.free?
  end

end
