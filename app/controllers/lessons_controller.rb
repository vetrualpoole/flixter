class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show]

  def show
      @lesson = Lesson.show
    end
    
    private

    def require_authorized_for_current_section
      if current_section.course.user != current_user
        render plain: 'Unauthorized', status: :Unauthorized
        redirect_to course_path(current_course)
      end
     end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video)
  end  
end


