class User < ApplicationRecord
  has_many :rentals
  has_one_attached :profile_image
end
