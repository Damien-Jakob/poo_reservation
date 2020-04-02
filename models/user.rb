class User < ActiveRecord::Base
  has_many :created_events, class_name: "Event"
  has_many :created_for_events, class_name: "Event"

  def to_s
    "#{firstname} #{lastname}"
  end
end