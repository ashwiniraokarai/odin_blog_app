class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  validates_presence_of :title, :body
end
