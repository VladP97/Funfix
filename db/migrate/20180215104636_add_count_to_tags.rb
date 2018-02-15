class AddCountToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :count, :integer, default: 1
  end
end
