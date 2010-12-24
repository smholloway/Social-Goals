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
  u.name = 'shayne'
  u.email = 'thelastemail@gmail.com'
  u.password = 'password'
  u.password_confirmation = 'password'
end

# Create some achievement types and levels
runner_achievement_type = AchievementType.create(:name => 'Running Champion')
runner_level1 = runner_achievement_type.levels.create(:name => 'Run 1 mile', :point_value => 10)
runner_level2 = runner_achievement_type.levels.create(:name => 'Run 5k', :point_value => 20)
runner_level3 = runner_achievement_type.levels.create(:name => 'Run Half Marathon', :point_value => 30)
runner_level4 = runner_achievement_type.levels.create(:name => 'Run Marathon', :point_value => 40)

traveler_achievement_type = AchievementType.create(:name => 'Globe Trotter')
traveler_level1 = traveler_achievement_type.levels.create(:name => 'Visit 10 States', :point_value => 10)
traveler_level2 = traveler_achievement_type.levels.create(:name => 'Visit All States', :point_value => 20)
traveler_level3 = traveler_achievement_type.levels.create(:name => 'Visit 5 Countries', :point_value => 30)
traveler_level4 = traveler_achievement_type.levels.create(:name => 'Visit All Continents', :point_value => 40)

# Create some goals and tasks
startup_goal = user_shayne.goals.create(:name => 'Create a startup with Seth', :public => true)
startup_task1 = startup_goal.tasks.create(:name => 'Learn Ruby on Rails', :percent_complete => 25) { |u| u.user_id = user_shayne.id}
startup_task2 = startup_goal.tasks.create(:name => 'Design initial prototype', :percent_complete => 5) { |u| u.user_id = user_shayne.id}

# Create some achievements
achievement1 = user_shayne.achievements.create { |a| a.level = runner_level1 }
