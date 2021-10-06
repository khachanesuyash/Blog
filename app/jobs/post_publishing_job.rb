class PostPublishingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    
    Post.create.(title: "Delayed Job", description: "Testing delayed job",
                category: Category.first)
    
    
  end
end
