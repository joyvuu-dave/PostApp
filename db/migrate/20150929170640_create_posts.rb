class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :author, index: true
      t.string :title
      t.text :content

      t.timestamps null: false
    end

    add_foreign_key :posts, :users, column: :author_id
  end
end
