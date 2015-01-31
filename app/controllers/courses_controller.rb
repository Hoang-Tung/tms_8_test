class CoursesController < ApplicationController
  before_action :supervisor_user, only: [:new , :create, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :new, :create, :edit, :update, :destroy]

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

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "Course update success"
      redirect_to courses_url
    else 
      render "edit"
    end
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

    def supervisor_user
      if !current_user.is_supervisor?
        flash[:danger] = "Xin loi be khong co quyen nay ^_^ bye bye!"
        redirect_to root_url 
      end
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end

# cap id_supervisor