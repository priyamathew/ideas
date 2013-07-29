class Group < ActiveRecord::Base
  has_many :users
  has_many :ideas
  has_one :admin, class_name: "User"
end
