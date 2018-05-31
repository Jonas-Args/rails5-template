require 'redis'
require 'json'

class RedisJobPusher

  def self.push_send_welcome_email(user_id)
    params = [user_id, "send_welcome_email"]
    RedisJobPusher.push_to_queue('Mailers::UserMailerWorker', params, 'queue:sparkpost_mailer')
  end

  def self.push_send_forgot_password_email(user_id)
    params = [user_id, "send_forgot_password_email"]
    RedisJobPusher.push_to_queue('Mailers::UserMailerWorker', params, 'queue:sparkpost_mailer')
  end

  def self.push_to_queue(worker_name, params, queue)
    redis_conf = Rails.application.config_for(:redis)

    redisurl = "redis://#{redis_conf['host']}:#{redis_conf['port']}/12"
    msg = { 'class' => worker_name, 'args' => params, 'retry' => false }

    redis = Redis.new(:url => redisurl)
    redis.rpush(queue, JSON.dump(msg))
  end

end
