# Micropost
class Micropost < ApplicationRecord
  belongs_to :user, foreign_key:'user_id'
  delegate :name, to: :user, prefix: true
  has_many :category_microposts, dependent: :destroy
  has_many :categories, through: :category_microposts, dependent: :destroy
  has_one_attached :image
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  has_many :comments, dependent: :destroy
end
