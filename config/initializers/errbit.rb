Airbrake.configure do |config|
  config.api_key = '9259046b8a70a3e477587851a4ae0fa3'
  config.host    = 'errbit.viciware.com'
  config.port    = 80
  config.secure  = config.port == 443
end
