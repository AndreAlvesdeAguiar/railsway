require 'rails_helper'

describe Launch do
  context '#create' do
    it 'create launch' do
      launch =
        Launch.create!(name: 'foo', slug: 'bar')
      expect(launch).to be_present
    end
  end

  context '#update' do
    let!(:launch) do
      create(:launch, name: 'foo', slug: 'bar')
    end

    it 'update values' do
      launch.update(name: 'BUZZ')

      expect(launch.reload.name).to eq('BUZZ')
    end
  end
end
