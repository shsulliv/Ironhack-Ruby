class UsersController < ApplicationController

	def show
		@users = User.find_by(id: params[:id]) ||
		render_404(user_params)
	end

	def new
		@user = User.new
	end

	def create
		
	end

	def destroy
		@destroyed_user = User.find_by(id: params[:id]).destroy
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
