Airbrake.configure do |config|
  config.api_key = '16dfd5a3a0cc0688235c1744de4716a0'
  config.host    = 'errbit.viciware.com'
  config.port    = 80
  config.secure  = config.port == 443
end
