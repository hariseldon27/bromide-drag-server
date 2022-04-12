class GalleriesController < ApplicationController
    before_action :authenticate_user!

    def new_gallery
        # puts current_user
        user = current_user
        featured_image = params[:featured_image]
        new_gallery = user.galleries.create( gallery_params )
        new_gallery.featured_image.attach(featured_image)
        # byebug
        new_gallery.featured_image_url = url_for(new_gallery.featured_image) if new_gallery.featured_image.attached?
        render json: new_gallery, include: :featured_image
    end

    def user_galleries
        # byebug
        user = current_user
        galleries = user.galleries
        galleries.map do |g|
            g[:featured_image_url]=url_for(g.featured_image) if g.featured_image.attached?
        end
        render json: galleries
    end

    def show
        # byebug
        gallery = Gallery.find_by!(id: params[:id])
        render json: gallery
    end

    def publish
        gallery = Gallery.find_by!(id: params[:id])
        gallery.update!(gallery_params)
        render json: gallery, status: :ok
    end


    private 
    def gallery_params
        params.permit( :gallery, :id, :title, :description, :user_id, :featured_image, :published, :published_on, :coda)
    end
end
