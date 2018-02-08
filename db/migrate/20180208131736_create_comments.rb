class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :fanfic, index: true, foreign_key: true
      t.text :comment
    end
  end
end
