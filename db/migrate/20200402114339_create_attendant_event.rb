class CreateAttendantEvent < ActiveRecord::Migration[6.0]
  def change
    create_table :attendants_events, id: false do |t|
      t.belongs_to :event, null: false
      t.references :attendant, index: true, foreign_key: {to_table: :users}, null: false
    end
  end
end
