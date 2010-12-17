class CreateAchievements < ActiveRecord::Migration
  def self.up
    create_table :achievements do |t|
      t.boolean :public, :null => false, :default => true
      t.integer :user_id, :null => false, :default => 0 # foreign key for user that owns this goal
      t.integer :level_id, :null => false, :default => 0 # foreign key for achievement type level
      
      t.timestamps
    end
    add_index :achievements, :user_id
    add_index :achievements, :level_id
  end

  def self.down
    drop_table :achievements
  end
end
