class LibraryUsersController < ApplicationController

	before_action :logged_in?

	def index
		@user = User.find(params[:user_id])
		@libraries = @user.libraries
	end

	def create
		@library = Library.find(params[:library_id])
    @library.users.push(current_user)  # no error handling currently

    redirect_to user_libraries_path(current_user)
	end

end
