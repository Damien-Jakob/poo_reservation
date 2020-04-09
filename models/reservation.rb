require_relative 'booking'

class Reservation < Booking
  has_and_belongs_to_many :reserved_items, class_name: "ReservableItem", foreign_key: "booking_id"

  def to_s
    "Reservation by #{created_by} (#{start_at} to #{end_at})"
  end
end