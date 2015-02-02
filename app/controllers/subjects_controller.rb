class SubjectsController < ApplicationController
  def new
  	@subject = Subject.new
  end

  def create
  	@subject = Subject.new(subject_params)
  	if @subject.save
  	  flash[:success] = "Welcome to the new course!"
      redirect_to @subject
    else
      render 'new'
    end
  end

  def destroy
  	Subject.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to courses_url
  end 

  def update
  end

  def edit
  end

  def index
  	@subject = Subject.paginate(page: params["page"])
  end

  def show
  	@subject = Subject.find(params[:id])
  end

  private 
  	def subject_params
  	  params.require(:course).permit(:name, :total_level, :info, :status)
  	end
end
