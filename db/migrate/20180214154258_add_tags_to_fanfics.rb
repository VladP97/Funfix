class AddTagsToFanfics < ActiveRecord::Migration[5.0]
  def change
    add_column :fanfics, :tags, :text
  end
end
