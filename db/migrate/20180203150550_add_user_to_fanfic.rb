class AddUserToFanfic < ActiveRecord::Migration
  def change
    add_reference :fanfics, :user, index: true, foreign_key: true
  end
end
