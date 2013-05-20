class UpdateIndexWorker
  include Sidekiq::Worker

  def perform(id)
    price = Price.find id
    price.tire.update_index
  end
end
