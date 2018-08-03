class Micropost < ApplicationRecord
    belongs_to :user
    validates :content, presence: true, length: { maximum: 140 }
    has_one_attached :image
    belongs_to :category
end
