require_relative 'booking'

class ReservationValidator < ActiveModel::Validator
  def validate(reservation)
    # example
    # unless reservation.name.starts_with? 'X'
    #reservation.errors[:reserved_items] << 'An item is already reserved'
    #end
  end
end

class Reservation < Booking
  has_and_belongs_to_many :reserved_items,
                          class_name: "ReservableItem",
                          foreign_key: "booking_id"
  has_and_belongs_to_many :reserved_furnitures,
                          class_name: "Furniture",
                          foreign_key: "booking_id",
                          association_foreign_key: "reservable_item_id"
  has_many :furniture_responsibles, -> { distinct }, through: :reserved_furnitures, source: :responsibles

  def concerned_users
    users = super
    furniture_responsibles.each do |furniture_responsible|
      users.find(furniture_responsible) ? nil : users << furniture_responsible
    end
    users
  end

  def to_s
    "Reservation by #{created_by} (#{start_at} to #{end_at})"
  end
end