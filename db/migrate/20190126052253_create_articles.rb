class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, nill: false
      t.text :body, null: false
      t.datetime :released_at, null: false
      t.datetime :expired_at
      t.boolean :member_only, null:false, default: false

      t.timestamps
    end
  end
end
