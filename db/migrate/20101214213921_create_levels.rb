class CreateLevels < ActiveRecord::Migration
  def self.up
    create_table :levels do |t|
      t.string :name, :null => false
      t.text :description # optional
      t.integer :point_value, :null => false, :default => 0
      t.boolean :visible, :null => false, :default => true # admin only
      t.integer :achievement_type_id, :null => false, :default => 0 # foreign key for parent achievement
      
      t.timestamps
    end
  end

  def self.down
    drop_table :levels
  end
end
