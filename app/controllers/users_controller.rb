class UsersController < ApplicationController
    before_action :authenticate_user!

    
    def index
        users = User.all
        render json: users
    end
    def show
        render json: {message: "you're in", user: current_user, avatar: show_avatar}
        # byebug
        # render json: {message: "you're in", user: current_user, avatar: rails_blob_path(current_user.avatar, disposition: "attachment") }
        # user.avatar ? render json: {message: "you're in", user: current_user, avatar: rails_blob_path(current_user.avatar, disposition: "attachment") }
        

        
    end
    def add_profile_photo
        user = current_user
        user.update!(user_params)
        user.profile_photo.attach(:profile_photo)
        render json: user, status: :ok
    end

    private
    def user_params
        params.permit(:email, :profile_photo)
    end
    def show_avatar
        if current_user.avatar.attached?
            return rails_blob_path(current_user.avatar, disposition: "attachment")
        else 
            return
        end
    end
end
