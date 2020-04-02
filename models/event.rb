class User < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :created_for, class_name: "User"
  
  def to_s
    name
  end
end