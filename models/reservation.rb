require_relative 'booking'

class ReservationValidator < ActiveModel::Validator
  def validate(reservation)
    if items_unavailable? reservation
      reservation.errors[:reserved_items] << 'An item is already reserved'
    end

    if furnitures_unavailable? reservation
      reservation.errors[:reserved_furnitures] << 'A furniture is already reserved'
    end
  end

  private

  def items_unavailable?(reservation)
    not reservation.reserved_items.all? do |reserved_item|
      reserved_item.available_for? reservation
    end
  end

  def furnitures_unavailable?(reservation)
    not reservation.reserved_furnitures.all? do |reserved_furnitures|
      reserved_furnitures.available_for? reservation
    end
  end
end

class Reservation < Booking
  include ActiveModel::Validations
  validates_with ReservationValidator

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