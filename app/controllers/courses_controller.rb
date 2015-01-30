class CoursesController < ApplicationController

  def index
    @courses = Course.paginate(page: params["page"])
  end  
  

  def show
  	@course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    course_params[:info] = 1
    if @course.save
      flash[:success] = "Welcome to the new course!"
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
    is_course_started(@course)
  end


  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to courses_url
  end
private

    def course_params
      params.require(:course).permit(:name, :total_level, :info, :status)
    end

    def is_course_started(course)
      unless course.status == 1
        flash[:danger] = "Course have been started"
        redirect_to courses_url
      end
    end
end
