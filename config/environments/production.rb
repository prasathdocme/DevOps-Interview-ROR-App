require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot for better performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensure a master key is available for credentials.
  # config.require_master_key = true

  # Enable static file serving (needed in ECS with Nginx)
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present? || true

  # Compress CSS using a preprocessor.
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # Store uploaded files on the local file system.
  config.active_storage.service = :local

  # Mount Action Cable outside main process or domain.
  # config.action_cable.mount_path = nil

  # Force SSL (Uncomment if you use HTTPS)
  # config.force_ssl = true

  # Logging
  config.log_level = :info
  config.log_tags = [:request_id]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Email configurations
  config.action_mailer.perform_caching = false
  # config.action_mailer.raise_delivery_errors = false

  # Locale fallback
  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false

  # Default logging formatter
  config.log_formatter = ::Logger::Formatter.new

  # Allow Docker container hostname and Load Balancer hostname
config.hosts << "rails--myalb-pjveuzumbw8z-1692894909.ap-south-1.elb.amazonaws.com"
#config.hosts.clear
  if ENV["LB_ENDPOINT"].present?
    config.hosts << ENV["LB_ENDPOINT"]
  end

  # Ensure logs go to STDOUT in ECS for CloudWatch logging
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
