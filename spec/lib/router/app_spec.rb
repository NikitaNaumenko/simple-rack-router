require 'spec_helper'

RSpec.describe Router::App do
  let!(:app) do
    rack_file = File.expand_path('./support/config.ru', 'spec/')
    Rack::Builder.parse_file(rack_file).first
  end

  describe '.call' do
    context 'when route exists' do
      describe 'root_path/' do
        subject { last_response.status }

        before { get('/') }

        it { is_expected.to eq 200 }
      end
    end
  end
end
