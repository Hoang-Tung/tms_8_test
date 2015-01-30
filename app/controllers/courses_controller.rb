class CoursesController < ApplicationController
  def new
  	@course = Course.new
  end

  def show
  	@course = Course.find(params[:id])
  end

  def index
  	@courses = Course.all
  end


end
