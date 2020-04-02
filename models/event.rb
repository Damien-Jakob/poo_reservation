class Event < ActiveRecord::Base
  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id"
  belongs_to :created_for, class_name: "User", foreign_key: "created_for_id"
  has_and_belongs_to_many :attended_by, class_name: "User", join_table: "events_attendants"

  validates :created_by,
            presence: true

  def to_s
    created_for_part = created_for ? ", for #{created_for}" : ""
    "#{name} (by #{created_by}" + created_for_part + ")"
  end

  def concerned_users
    concerned_users = []
    concerned_users << attended_by
    concerned_users.find(created_by) ?  nil : concerned_users << created_by
    concerned_users.find(created_for) ? nil : concerned_users << created_for
    concerned_users
  end
end