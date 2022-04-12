class BlocksController < ApplicationController
    before_action :authenticate_user!

    def new_block
        # byebug
        
        gallery = Gallery.find_by!(id: params[:gallery_id])
        new_block = gallery.blocks.create!( block_params, except: :image )
        new_block.image.attach(params[:image])
        render json: new_block
    end



    private

    def block_params
        params.permit(:gallery_id, :block_type, :text, :image, :bg_color, :font, :font_color, :font_size, :width, :text_align, :text_location )
    end

end
