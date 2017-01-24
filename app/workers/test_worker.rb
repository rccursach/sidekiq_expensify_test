class TestWorker
  include Sidekiq::Worker
  #sidekiq_options :queue => :default, :retry => false, :backtrace => false
  def perform(*args)
    puts 'SIDEKIQ WORKER RUNNING TEST TASK'
    ExpensesImporterJob.run
  end
end
