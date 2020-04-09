class CreateReservable < ActiveRecord::Migration[6.0]
  def change
    create_table :reservable_items do |t|
      t.string :type
      t.string :name, limit: 50, null: false
      t.string :manual
    end

    create_join_table :users, :reservable_items, table_name: :furniture_responsibles
  end
end
