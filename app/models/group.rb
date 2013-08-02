class Group < ActiveRecord::Base
  has_many :usergroups
  has_many :users, through: :usergroups
  has_many :ideas
  belongs_to :admin, class_name: "User"
  before_save :create_group_code
  
  def create_group_code
    self.group_code = Array.new(8){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
  end

  def votes_needed
    self.users.count
  end

end
