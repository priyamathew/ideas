class CreateUsergroups < ActiveRecord::Migration
  def change
    create_table :usergroups do |t|
      t.belongs_to :user
      t.belongs_to :group
      t.timestamps
    end
  end
end
