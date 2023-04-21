class ImportLaunchersService < ApplicationService
  attr_accessor :launcher_data

  def initialize(launcher_data)
    @launcher_data = launcher_data
  end

  def call
    @launcher = Launch.find_or_initialize_by(
      import_id: launcher_data['id'],
      slug: launcher_data['slug']
    )

    create_launcher if @launcher.new_record?
    update_launcher if @launcher.need_update?(launcher_data.to_json)

    { message: "No create or update needed" }
  end

  private

  def create_launcher
    attributes = launcher_data.except('id', 'slug')
    @launcher.attributes = attributes
    @launcher.last_import_code = Digest::MD5.hexdigest(launcher_data.to_json)

    return { successful: true, method: :create } if @launcher.save

    Rails.logger.info("####### Erro when creating launcher. Id: #{launcher_data['id']}, ERROR: #{@launcher.errors.full_messages}")
    { successful: false, method: :create }
  end

  def update_launcher
    attributes = launcher_data.except('id', 'slug')
    code = Digest::MD5.hexdigest(launcher_data.to_json)
    attributes.merge!{"last_import_code" => code }

    return { successful: true, method: :update } if @launcher.update(attributes)

    Rails.logger.info("####### Erro when updating launcher. Id: #{launcher_data['id']}, ERROR: #{@launcher.errors.full_messages}")
    { successful: false, method: :update }
  end
end
