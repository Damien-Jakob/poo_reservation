class CreateEvent < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, limit: 50, null: false
      t.references :created_by, index: true, foreign_key: { to_table: :users }, null: false
      t.references :created_for, index: true, foreign_key: { to_table: :users }, null: true
      t.timestamps null: false
    end
  end
end
