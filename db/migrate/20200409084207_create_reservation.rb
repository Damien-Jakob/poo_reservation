class CreateReservation < ActiveRecord::Migration[6.0]
  def change
    rename_table :events, :bookings

    change_table :bookings do |t|
      t.rename :created_at, :start_at
      t.rename :updated_at, :end_at
      t.string :type
    end

    change_column_null :bookings, :name, true

    rename_table :events_attendants, :bookings_attendants

    change_table :bookings_attendants do |t|
      t.rename :event_id, :booking_id
    end

    create_join_table :bookings, :reservable_items
  end
end
