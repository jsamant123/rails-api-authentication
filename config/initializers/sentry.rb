Raven.configure do |config|
  config.async = ->(event) { SentryJob.perform_later(event) }
  config.dsn = Figaro.env.SENTRY_DSN
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
