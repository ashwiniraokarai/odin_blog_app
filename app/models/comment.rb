class Comment < ApplicationRecord
  belongs_to :article
  validates_presence_of :author_name, :body
end
