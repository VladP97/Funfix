class User < ApplicationRecord
  has_many :comments
  has_many :fanfics

  validates :login, uniqueness: true

  devise :database_authenticatable, :registerable, :confirmable, :async,
         :recoverable, :rememberable, :trackable, :validatable
end
