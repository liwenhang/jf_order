# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.default charset: "utf-8"
ActionMailer::Base.default content_type: "text/html"
ActionMailer::Base.default from: Settings.email.sender
ActionMailer::Base.delivery_method = Settings.email.delivery_method.to_sym
ActionMailer::Base.smtp_settings = {
    address: Settings.email.address,
    port: Settings.email.port,
    user_name: Settings.email.user_name,
    password: Settings.email.password,
    authentication: Settings.email.authentication,
    domain: Settings.email.domain,
    enable_starttls_auto: true
}
