class Comment < ApplicationRecord
  belongs_to :fanfic
  belongs_to :user
  belongs_to :like
end