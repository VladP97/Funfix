class Fanfic < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  has_many :chapters, dependent: :destroy
  belongs_to :users
end
