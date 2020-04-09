require_relative 'reservableItem'

class Furniture < ReservableItem
  has_and_belongs_to_many :responsibles,
                          class_name: "User",
                          join_table: "furniture_responsibles",
                          foreign_key: "reservable_item_id",
                          association_foreign_key: "user_id"

  validates :name,
            length: {
                minimum: 1,
                maximum: 50,
            }

  def to_s
    name
  end
end
