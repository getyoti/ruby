# frozen_string_literal: true

require 'spec_helper'

describe 'Sandbox::Client' do
  let :app_id do
    '0000-0000-0000-0000'
  end
  let :base_url do
    'https://example.com'
  end
  let :private_key do
    key = OpenSSL::PKey::RSA.new 1024
    Base64.encode64(key.to_der)
  end
  let :profile do
    {}
  end
  let :client do
    Sandbox::Client.new(app_id: app_id, private_key: private_key, base_url: base_url)
  end
  describe '.initialize' do
    it 'Creates a client' do
      expect(client.app_id).to eql app_id
      expect(client.key).not_to be_nil
      expect(client.base_url).to eql base_url
    end
  end
  context 'with a valid profile payload' do
    before(:context) do
      stub_request(:any, %r{https:\/\/}).to_return(
        status: 201,
        body: File.read('spec/sample-data/responses/sandbox_share.json'),
        headers: { 'Content-Type' => 'application/json' }
      )
    end
    describe '.setup_sharing_profile' do
      let :token do
        client.setup_sharing_profile(profile)
      end
      it 'returns an encrypted token' do
        expect(token).not_to be_nil
      end
    end
  end
  context 'when the profile payload is invalid' do
    before :context do
      stub_request(:any, %r{https:\/\/}).to_return(
        status: 400,
        body: File.read('spec/sample-data/responses/sandbox_share.json'),
        headers: { 'Content-Type' => 'application/json' }
      )
    end
    it 'raises an error' do
      expect { client.setup_sharing_profile(profile) }.to raise_error RuntimeError
    end
  end
end