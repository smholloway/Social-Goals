class CreateAchievements < ActiveRecord::Migration
  def self.up
    create_table :achievements do |t|
      t.boolean :public, :null => false, :default => true
      t.integer :user_id # foreign key for user that owns this goal
      t.integer :level_id # foreign key for achievement type level
      
      t.timestamps
    end
  end

  def self.down
    drop_table :achievements
  end
end
