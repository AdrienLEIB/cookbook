class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts 'Start working'
    sleep 5
    puts 'Work done'
  end
end
