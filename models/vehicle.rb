require_relative 'reservableItem'

class Vehicle < ReservableItem
  validates :name,
            length: {
                minimum: 1,
                maximum: 50,
            }
  validates :manual,
            length: {
                minimum: 5,
            }

  def to_s
    "#{name} (#{manual})"
  end
end
