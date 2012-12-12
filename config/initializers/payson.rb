
PaysonAPI.configure do |config|
  conf = YAML.load_file('config/payson.yml')

  config.api_user_id = conf['payson']['user']
  config.api_password = conf['payson']['password']
end
