class ReservableItem < ActiveRecord::Base
  has_and_belongs_to_many :can_be_reserved_by_groups, class_name: "Group"
  def to_s
    name
  end
end
