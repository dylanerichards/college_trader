Rails.application.configure do
  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = false

  config.assets.js_compressor = :uglifier

  config.assets.compile = true

  config.assets.digest = true

  config.log_level = :info

  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false

  config.action_mailer.default_url_options = { :host => 'albany-trader.herokuapp.com' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => 'utf-8'

  config.action_mailer.smtp_settings = {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'albany-trader.heroku.com',
    :user_name => 'ualbanytrade',
    :password => 'ualbanytrade123',
    :authentication => 'plain',
    :enable_starttls_auto => true
  }
end
