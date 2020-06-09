class ReservableItem < ActiveRecord::Base
  has_and_belongs_to_many :can_be_reserved_by_groups, class_name: "Group"
  has_and_belongs_to_many :reservations,
                          association_foreign_key: "booking_id"
  has_many :can_be_reserved_by_users, -> { distinct }, through: :can_be_reserved_by_groups, source: :members

  def available_between?(start_at, end_at)
    reservations.all? do |reservation|
      reservation.end_at < start_at or reservation.start_at > end_at
    end
  end

  def available_for?(reservation)
    reservations.all? do |item_reservation|
      item_reservation.end_at < reservation.start_at or
          item_reservation.start_at > reservation.end_at or
          reservation == item_reservation
    end
  end

  def to_s
    name
  end
end
