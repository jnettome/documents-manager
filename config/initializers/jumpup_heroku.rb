Jumpup::Heroku.configure do |config|
  config.app = 'odonto-files'
end if Rails.env.development?