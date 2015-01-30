class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,  only: [:edit, :update]
  before_action :supervisor_user, only: [:destroy, :new]  

  def index
    if current_user.is_supervisor?
      @users = User.paginate(page: params[:page])
    else      
      @users = User.paginate(page: params[:page]).where(:role => "trainer")
    end    
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      flash[:success] = "welcome to the my App"
  		redirect_to @user
  	else
  		render "new"
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile update"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password,
  									:password_confirmation)
  	end

   # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])

      if current_user.is_trainer? || current_user =! @user  
        flash[:danger] = "Vao nham hang roai, moi te ra cho -_- , get out now!!!"
        redirect_to(root_url) unless current_user?(@user)
      end
    end

    def supervisor_user
      if !current_user.is_supervisor?
        flash[:danger] = "Xin loi be khong co quyen nay ^_^ bye bye!"
        redirect_to root_url 
      end
    end


end
