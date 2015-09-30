require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
  test "course created" do
    user = FactoryGirl.create(:user)
    sign_in user

    assert_difference 'Course.count' do
          post :create, {:course => {
            :title => 'test',
            :description => 'Describe the course',
            :cost => 0
          }
        }
    end

    assert_redirected_to instructor_course_path(Course.last)
    assert_equal 1, user.courses.count
  end

end
