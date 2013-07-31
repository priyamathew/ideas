class Group < ActiveRecord::Base
  has_many :users
  has_many :ideas
  belongs_to :admin, class_name: "User"
  before_save :create_group_code

  def create_group_code
    self.group_code = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join
  end

end
