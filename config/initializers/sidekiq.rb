redis_conf = Rails.application.config_for(:redis)

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{redis_conf['host']}:#{redis_conf['port']}/12" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{redis_conf['host']}:#{redis_conf['port']}/12" }
end
