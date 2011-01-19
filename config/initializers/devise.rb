Devise.setup do |config|
  config.mailer_sender = "tgannon@gmail.com"
  require 'devise/orm/mongoid'
  require 'multi_json'
  
  MultiJson.engine = :active_support
  
  config.stretches = 10
  config.pepper = "0cdad2a354a9a3d2639025321bcfea9b9c8268c088499b067c94e8ce713df07648a1d07475749aee99cf14e98a0613f45524b44554a04bb20d00d1fae2c7d742"
  config.omniauth :facebook, '111380765596113', '4eb3ee73753f31230349f58d69066209'

  [Devise::ConfirmationsController,
    Devise::PasswordsController,
    Devise::RegistrationsController,
    Devise::SessionsController,
    Devise::UnlocksController].each do |controller_class|
    controller_class.send :include, Whisper::DeviseResourceBuiler
  end
end











