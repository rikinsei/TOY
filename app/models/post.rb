class Post < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :body
  belongs_to :blog
  belongs_to :category
  
end
