class UsersController < ApplicationController
    before_action :authenticate_user!

    
    def index
        users = User.all
        render json: users
    end
    def show
        # byebug
        render json: {message: "you're in", user: current_user, avatar: rails_blob_path(current_user.avatar, disposition: "attachment") }
    end
    def add_profile_photo
        user = current_user
        user.update(user_params)
        render json: user, status: :ok
    end

    private
    def user_params
        params.permit(:email, :profile_photo)
    end
end
