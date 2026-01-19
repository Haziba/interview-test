class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :cover_image
end
