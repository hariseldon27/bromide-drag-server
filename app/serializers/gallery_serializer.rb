class GallerySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :published, :published_on
  has_many :blocks

  private
  # def show_block_image
  #   if @block.image.attached?
  #       host = "http://localhost:3000"
  #       return host + rails_blob_path(@block.image, disposition: "attachment")
  #   else 
  #       return
  #   end
  # end
end
