class UsersController < ApplicationController

	before_action :logged_in?, only: [:show]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		login(@user)
    redirect_to @user
	end

	def show
		@user = User.find_by_id(params[:id])
		@currentuser = current_user
		# must be who you say you are to see user show view
		redirect_to user_path(@currentuser) unless @user[:id] == @currentuser[:id]
	end

	private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
