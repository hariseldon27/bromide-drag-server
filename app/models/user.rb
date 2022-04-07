class User < ApplicationRecord

  has_one_attached :avatar
  has_one_attached :profile_photo
  
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
end