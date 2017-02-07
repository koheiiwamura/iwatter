class AddNicknameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :username, :string
    add_column :users, :visibility, :integer, default: 0
  end
end
