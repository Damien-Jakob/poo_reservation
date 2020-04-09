class User < ActiveRecord::Base
  has_many :created_bookings, class_name: "Booking", foreign_key: "created_by_id"
  has_many :attributed_bookings, class_name: "Booking", foreign_key: "created_for_id"
  has_and_belongs_to_many :attended_bookings, class_name: "Booking", join_table: "bookings_attendants"
  has_and_belongs_to_many :responsible_for_furnitures,
                          class_name: "Furniture",
                          join_table: "furniture_responsibles",
                          foreign_key: "user_id",
                          association_foreign_key: "reservable_item_id"
  has_and_belongs_to_many :member_of, class_name: "Group", join_table: "groups_members"

  validates :firstname, :lastname,
            length: {
                minimum: 1,
                maximum: 50,
            }

  def to_s
    "#{firstname} #{lastname}"
  end
end