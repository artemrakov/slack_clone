class LongJob < ApplicationJob
  queue_as :default

  def perform
    puts "Hello world"
  end
end
