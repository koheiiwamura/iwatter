class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :tweet
      t.timestamps
    end
  end
end
