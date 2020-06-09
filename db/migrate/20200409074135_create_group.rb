class CreateGroup < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, limit: 50, null: false
    end

    create_join_table :groups, :users, table_name: :groups_members
  end
end
