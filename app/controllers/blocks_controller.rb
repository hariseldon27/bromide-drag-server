class BlocksController < ApplicationController

    before_action :authenticate_user!

    def new_block
        # byebug
        gallery = Gallery.find_by!(id: params[:id])
        new_block = gallery.blocks.create!( block_params )
        render json: new_block
    end

    private
    def block_params
        params.require(:block).permit(:gallery_id, :block_type, :text, :image, :bg_color, :font_color, :font_size, :width, :text_align, :text_location )
    end

end
