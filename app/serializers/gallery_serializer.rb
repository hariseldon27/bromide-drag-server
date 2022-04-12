class GallerySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :published, :published_on
  has_many :blocks





end
