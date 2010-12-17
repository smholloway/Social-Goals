class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.string :name, :null => false
      t.text :description # optional
      t.boolean :public, :null => false, :default => false
      t.integer :user_id, :null => false, :default => 0 # foreign key for user that owns this goal
      
      t.timestamps
    end
    add_index :goals, :user_id
  end

  def self.down
    drop_table :goals
  end
end
