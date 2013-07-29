class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.belongs_to :user
      t.belongs_to :group
      t.timestamps
    end
  end
end
