class Group < ActiveRecord::Base
  has_and_belongs_to_many :members, class_name: "User", join_table: "groups_members"

  validates :name,
            length: {
                minimum: 1,
                maximum: 50,
            }

  def to_s
    name
  end
end