class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :category
      t.string :link_url
      t.integer :votes
      t.integer :user_id
    end
  end
end
