Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

# Load sidekiq-cron schedule file
Sidekiq.configure_server do |config|
  schedule_file = "config/schedule.yml"

  if File.exists?(schedule_file)
    jobs_hash = YAML.load_file(schedule_file)
    puts "Loading schedule file \n#{jobs_hash}"
    Sidekiq::Cron::Job.load_from_hash! jobs_hash
  end
end