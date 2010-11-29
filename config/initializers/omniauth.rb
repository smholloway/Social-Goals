# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'iadehlAKmaP8l1cEpoA', '0wBuYBHqiTrsB2m9Nk0s0ChlTVC3lvneexuEqDL1U0'
end
