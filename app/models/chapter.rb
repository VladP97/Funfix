class Chapter < ApplicationRecord
  has_many :fanfics
  has_many :comments, through: :fanfics
  has_many :users, through: :comments
  has_many :ratings
  belongs_to :fanfic
end
