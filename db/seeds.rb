# WARNING: This will zero out the entire DB!
Admin.delete_all
User.delete_all
AchievementType.delete_all
Level.delete_all
Goal.delete_all
Task.delete_all

# Create some admins and users
admin_shayne = Admin.create! do |u|
  u.email = 'smcucf@yahoo.com'
  u.password = 'password'
  u.password_confirmation = 'password'
end
user_shayne = User.create! do |u|
  u.name = 'Shayne'
  u.email = 'thelastemail@gmail.com'
  u.password = 'password'
  u.password_confirmation = 'password'
end

# Create some achievement types and levels
runner_achievement_type = AchievementType.create(:name => 'Running Champion')
runner_level1 = Level.create(:name => 'Run 1 mile', :point_value => 10, :achievement_type_id => runner_achievement_type.id)
runner_level2 = Level.create(:name => 'Run 5k', :point_value => 20, :achievement_type_id => runner_achievement_type.id)
runner_level3 = Level.create(:name => 'Run Half Marathon', :point_value => 30, :achievement_type_id => runner_achievement_type.id)
runner_level4 = Level.create(:name => 'Run Marathon', :point_value => 40, :achievement_type_id => runner_achievement_type.id)

traveler_achievement_type = AchievementType.create(:name => 'Globe Trotter')
traveler_level1 = Level.create(:name => 'Visit 10 States', :point_value => 10, :achievement_type_id => traveler_achievement_type.id)
traveler_level2 = Level.create(:name => 'Visit All States', :point_value => 20, :achievement_type_id => traveler_achievement_type.id)
traveler_level3 = Level.create(:name => 'Visit 5 Countries', :point_value => 30, :achievement_type_id => traveler_achievement_type.id)
traveler_level4 = Level.create(:name => 'Visit All Continents', :point_value => 40, :achievement_type_id => traveler_achievement_type.id)

# Create some goals and tasks
startup_goal = Goal.create(:name => 'Create a startup with Seth', :public => true, :user_id => user_shayne.id)
startup_task1 = Task.create(:name => 'Learn Ruby on Rails', :percent_complete => 25, :user_id => user_shayne.id, :goal_id => startup_goal.id)
startup_task2 = Task.create(:name => 'Design initial prototype', :percent_complete => 5, :user_id => user_shayne.id, :goal_id => startup_goal.id)
