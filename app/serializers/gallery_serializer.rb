class GallerySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :published, :published_on, :coda
  has_many :blocks




end
