class CreateAttendantEvent < ActiveRecord::Migration[6.0]
  def change
    create_join_table :events, :users, table_name: :events_attendants
  end
end
