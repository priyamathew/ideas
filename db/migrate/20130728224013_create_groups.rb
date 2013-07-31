class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :group_code
      t.belongs_to :admin
      t.timestamps
    end
  end
end
