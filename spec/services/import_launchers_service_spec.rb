require 'rails_helper'

describe ImportLaunchersService do
  include ApiAsJsonHelper
  include_context 'launcher_data'

  describe "When import launcher service is called" do
    context "and the launch doesn'\t exist in database" do
      it 'create launch' do
        described_class.call(launcher_data)
        launch = Launch.find_by(name: 'Sputnik 8K74PS | Sputnik 1')

        expect(Launch.count).to eq(1)
        expect(launch.attributes.except('created_at', 'updated_at', 'imported_t'))
          .to eq(launch_as_json(launch).except('created_at', 'updated_at', 'imported_t'))
        expect(launch.imported_t.to_s).to eq(Date.today.to_s)
      end
    end

    context "and the launch exist in database" do
      before do
        launch = Launch.new(launcher_data)
        launch.last_import_code = Digest::MD5.hexdigest(launcher_data.to_json)
        launch.import_id = launcher_data['id']
        launch.import_status = 'published'
        launch.save
      end

      it 'update launch' do
        described_class.call(update_launcher_data)
        launch = Launch.find_by(name: 'Update Sputnik 8K74PS | Sputnik 1')

        expect(Launch.count).to eq(1)
        expect(launch.attributes.except('created_at', 'updated_at', 'imported_t'))
          .to eq(launch_as_json(launch).except('created_at', 'updated_at', 'imported_t'))
        expect(launch.imported_t.to_s).to eq(Date.today.to_s)
        expect(launch.image).to eq('No image detected in update')
        expect(launch.last_import_code).to_not eq(Digest::MD5.hexdigest(update_launcher_data.to_json))
      end
    end
  end
end
