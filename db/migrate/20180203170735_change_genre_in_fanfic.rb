class ChangeGenreInFanfic < ActiveRecord::Migration
  def change
    remove_foreign_key :fanfics, :genre
    add_column :fanfics, :genre, :string
  end
end
