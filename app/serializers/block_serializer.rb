class BlockSerializer < ActiveModel::Serializer
  attributes :id, :gallery_id, :block_type, :text, :bg_color, :font_color, :font_size, :font, :text_align, :text_location, :width, include: image
  has_one_attached :image
  has_one :gallery
end
