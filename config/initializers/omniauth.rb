Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,        ENV['GITHUB_KEY'],   ENV['GITHUB_SECRET'],   scope: 'email,profile'

  provider :eve_online, ENV['EVE_ONLINE_APP_ID'],ENV['EVE_ONLINE_APP_SECRET'], scope: 'publicData'
end
