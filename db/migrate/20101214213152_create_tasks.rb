class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name, :null => false
      t.text :description # optional
      t.date :deadline # optional
      t.integer :percent_complete, :null => false, :default => 0
      t.integer :goal_id, :null => false # foreign key for parent goal
      t.integer :parent_id # foreign key for circular references for nested tasks (can be null!)

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
