class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrollment_to_view_lessons, only: [:show]
  
  def show
    @lesson = current_lesson
  end
  
  private
  
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
      
    def require_enrollment_to_view_lessons
      if current_user.enrolled_in?(current_lesson.section.course) == false
        redirect_to course_path(current_lesson.section.course), alert: 'NOT CURRENTLY ENROLLED'
    end
  end
end