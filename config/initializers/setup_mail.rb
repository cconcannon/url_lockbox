if Rails.env != 'test'
  email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/email.yml"))
  email_settings["development"][:user_name] = ENV["gmail_username"]
  email_settings["development"][:password] = ENV["gmail_password"]
  email_settings["production"][:user_name] = ENV["gmail_username"]
  email_settings["production"][:password] = ENV["gmail_password"]
  ActionMailer::Base.smtp_settings = email_settings[Rails.env] unless email_settings[Rails.env].nil?
end
