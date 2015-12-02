if ENV['ERRBIT_KEY'] && ENV['ERRBIT_HOST']
   Airbrake.configure do |config|
    config.api_key = ENV['ERRBIT_KEY'] 
    config.host    = ENV['ERRBIT_HOST']
    config.port    = ENV.fetch('ERRBIT_PORT',80)
    config.secure  = config.port == 443
  end
end
