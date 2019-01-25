class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :number, null: false          #背番号
      t.string :name, null: false             #ユーザー名
      t.string :full_name                     #本名
      t.string :email
      t.date :birthday
      t.integer :sex, nill: false, default: 1
      t.integer :administrator, null: false, default: false #管理者フラグ
      t.timestamps
    end
  end
end
