class Fanfic < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  has_many :ratings, through: :chapters
  has_many :chapters, dependent: :destroy
end
