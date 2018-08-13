# CategoryMicropost
class CategoryMicropost < ApplicationRecord
  belongs_to :category, counter_cache: :microposts_count
  belongs_to :micropost
end
