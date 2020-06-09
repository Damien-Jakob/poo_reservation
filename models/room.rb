require_relative 'reservableItem'

class Room < ReservableItem
  validates :name,
            length: {
                minimum: 1,
                maximum: 50,
            }

  def to_s
    "Room #{name}"
  end
end
