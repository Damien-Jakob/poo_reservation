class Event < ActiveRecord::Base
  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id"
  belongs_to :created_for, class_name: "User", foreign_key: "created_for_id"

  def to_s
    name
  end
end