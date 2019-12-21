require 'rails_helper'
require_relative '../../app/services/json_ip'

RSpec.describe JsonIp do
  it 'gets the ip' do
    stub_request(:get, "https://jsonip.org/").
      to_return(status: 200, body: '{"ip":"1.2.3.4"}', headers: {})
    expect(JsonIp.ip).to eq '1.2.3.4'
  end
end
