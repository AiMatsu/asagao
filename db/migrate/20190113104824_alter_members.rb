class AlterMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :phone, :string
    add_index :members, :name, unique: true, name: 'name_index'
  end
end
