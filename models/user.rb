class User < ActiveRecord::Base
  has_many :created_events, class_name: "Event", foreign_key: "created_by_id"
  has_many :attributed_events, class_name: "Event", foreign_key: "created_for_id"

  validates :firstname, :lastname,
            length: {
                minimum: 1,
                maximum: 50,
            }
  def to_s
    "#{firstname} #{lastname}"
  end
end