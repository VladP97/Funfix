class Comment < ApplicationRecord
  belongs_to :fanfic
  belongs_to :user
end