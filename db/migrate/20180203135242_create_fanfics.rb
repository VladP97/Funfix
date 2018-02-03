class CreateFanfics < ActiveRecord::Migration
  def change
    create_table :fanfics do |t|
      t.references :genre, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
