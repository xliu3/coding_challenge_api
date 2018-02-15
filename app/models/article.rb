class Article < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :tags, presence: true


end
