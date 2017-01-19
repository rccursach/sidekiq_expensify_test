class TestWorker
  include Sidekiq::Worker

  def perform(partner_id, partner_secret)
    puts 'SIDEKIQ WORKER RUNNING TEST TASK'
  end
end
