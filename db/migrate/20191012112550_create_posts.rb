#rails g model postでマイグレーションファイルを作成する

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.timestamps
    end
  end
end
