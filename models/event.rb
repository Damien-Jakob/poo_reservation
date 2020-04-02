class Event < ActiveRecord::Base
  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id"
  belongs_to :created_for, class_name: "User", foreign_key: "created_for_id"

  def to_s
    created_for_part = created_for ? ", for #{created_for}" : ""
    "#{name} (by #{created_by}" + created_for_part + ")"
  end
end