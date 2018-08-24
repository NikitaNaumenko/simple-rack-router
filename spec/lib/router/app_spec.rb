require 'spec_helper'

RSpec.describe Router::App do
  let!(:app) do
    rack_file = File.expand_path('./support/config.ru', 'spec/')
    Rack::Builder.parse_file(rack_file).first
  end

  describe '.call' do
    subject { last_response.status }

    context 'when route exists' do
      describe 'root_path/' do
        before { get('/') }

        it { is_expected.to eq 200 }
      end

      describe 'path_with_params' do
        before { get('hello/username') }

        it { is_expected.to eq 200 }
        context 'body' do
          subject { last_response.body }

          it { is_expected.to include('username') }
          it { is_expected.to include({ name: 'username' }.to_json) }
        end
      end
    end

    context 'when route doesn exists' do
      before { get('not_exists_path/') }

      it { is_expected.to eq 404 }
    end
  end
end
