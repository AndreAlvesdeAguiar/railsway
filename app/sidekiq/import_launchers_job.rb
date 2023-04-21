class ImportLaunchersJob
  include Sidekiq::Job
  include ImportLaunchersDataLogics
  sidekiq_options queue: 'import', retry: false

  def perform
    Rails.logger.info("########## Started to import launchers data ##########")
    set_instance_variables

    loop do
      response = import_data

      if response[:error].present?
        Rails.logger.info("########## API ERROR: #{response[:error]} ##########")
        break
      end

      break if page_limit(@url) >= 2100
    end

    Rails.logger.info("########## Routine Finished. Launchers Created: #{@launchers_created}, Launchers Updated: #{@launchers_updated} ##########")
  end
end
