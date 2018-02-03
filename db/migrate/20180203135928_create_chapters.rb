class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.references :fanfic, index: true, foreign_key: true
      t.string :title
      t.text :text
      t.string :image

      t.timestamps null: false
    end
  end
end
