class TestWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :test, :retry => false, :backtrace => false
  def perform(partner_id, partner_secret)
    puts 'SIDEKIQ WORKER RUNNING TEST TASK'
  end
end
