class AddThemeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :theme, :string, default: 'light'
  end
end
