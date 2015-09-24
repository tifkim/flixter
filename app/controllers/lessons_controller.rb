class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :enrolled_user

  def show
  end

  private

  helper_method :current_lesson

  def enrolled_user
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), :alert => 'You must be enrolled to view lessons in detail.'
    end
  end

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
