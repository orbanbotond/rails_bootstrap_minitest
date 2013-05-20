class DeleteIndexWorker
  include Sidekiq::Worker

  def perform(id)
    price = Price.find id
    price.set_destroyed_4_tire
    UpdateIndexWorker.perform_async id
  end
end
