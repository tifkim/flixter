require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase

  test "section created" do
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course)

    assert_difference('Section.count') do
      post :create, :course_id => course.id, :section => {:title => 'Test'}
    end

    assert_redirected_to instructor_course_path(Course.last)
  end

end
