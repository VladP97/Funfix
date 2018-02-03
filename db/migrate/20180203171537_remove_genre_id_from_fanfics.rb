class RemoveGenreIdFromFanfics < ActiveRecord::Migration
  def change
    remove_column :fanfics, :genre_id
  end
end
