require 'sidekiq-cron'

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq::Cron::Job.create(
      name: 'Daily Inventory Report',
      cron: '0 9 * * *', # Todo dia às 9h da manhã
      class: 'InventoryReportJob'
    )
  end
end
