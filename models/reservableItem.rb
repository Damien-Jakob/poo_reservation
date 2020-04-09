class ReservableItem < ActiveRecord::Base
  has_and_belongs_to_many :can_be_reserved_by_groups, class_name: "Group"
  has_many :can_be_reserved_by_users, -> { distinct }, through: :can_be_reserved_by_groups, source: :members
  def to_s
    name
  end
end
