class User < ApplicationRecord
  has_many :comments
  has_many :fanfics
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
