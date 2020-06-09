class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstname, limit: 50, null: false
      t.string :lastname, limit: 50, null: false
    end
  end
end
