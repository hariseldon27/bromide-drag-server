class GalleriesController < ApplicationController
    before_action :authenticate_user!

    def new_gallery
        # puts current_user
        user = current_user
        new_gallery = user.galleries.create( gallery_params )
        # new_gallery.attach.featured_image(params[:featured_image])
        render json: new_gallery
    end

    def user_galleries
        # byebug
        user = current_user
        render json: user.galleries
    end

    def show
        # byebug
        gallery = Gallery.find_by!(id: params[:id])
        render json: gallery
    end


    private 
    def gallery_params
        params.permit(:id, :title, :description, :user_id, :featured_image, :published, :published_on, :featured_image)
    end
end
