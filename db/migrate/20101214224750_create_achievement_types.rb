class CreateAchievementTypes < ActiveRecord::Migration
  def self.up
    create_table :achievement_types do |t|
      t.string :name, :null => false
      t.text :description # optional
      t.string :icon_url # optional
      t.boolean :visible, :null => false, :default => true # admin only
      t.boolean :active, :null => false, :default => true # admin only
      
      t.timestamps
    end
  end

  def self.down
    drop_table :achievement_types
  end
end
