class Chapter < ApplicationRecord
  has_many :fanfics
  has_many :comments, through: :fanfics
  has_many :users, through: :comments
  belongs_to :fanfic
end
