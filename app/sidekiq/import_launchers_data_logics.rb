module ImportLaunchersDataLogics
  module_function

  def set_instance_variables
    @url = 'https://ll.thespacedevs.com/2.0.0/launch/'
    @params = { limit: 100 }
    @service = Launchers::Service.new
    @job_run_times = 0
    @launchers_created = 0
    @launchers_updated = 0
  end

  def import_data
    import_counters = { update: 0, create: 0}
    service_response = @service.import_data(@url, @params)

    return { error: service_response['detail'] } if service_response['detail'].present?

    service_response['results'].each do |launcher_data|
      response = ImportLaunchersService.call(launcher_data.deep_stringify_keys!)
      import_counters[response[:method]] += 1 if response&.[](:successful) == true
    end

    @url = service_response['next']
    @job_run_times += 1
    @launchers_created += import_counters[:create]
    @launchers_updated += import_counters[:update]

    Rails.logger.info("########## Execution: #{@job_run_times}. Launchers created: #{import_counters[:create]}, Launchers updated: #{import_counters[:update]}")
    { successful: true }
  end

  def page_limit(url)
    url.split('offset=').last.to_i
  end
end
