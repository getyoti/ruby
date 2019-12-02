# frozen_string_literal: true

require 'spec_helper'

require 'base64'
require 'yoti'

def create_thirdparty_data_proto(token, expiry_date, *definitions)
  issuing_attributes = Yoti::Protobuf::Sharepubapi::IssuingAttributes.new
  issuing_attributes.expiry_date = ''
  issuing_attributes.expiry_date = expiry_date.iso8601(9) if expiry_date
  definitions.each do |s|
    name = Yoti::Protobuf::Sharepubapi::Definition.new
    name.name = s
    issuing_attributes.definitions += [name]
  end

  attribute = Yoti::Protobuf::Sharepubapi::ThirdPartyAttribute.new
  attribute.issuance_token = token
  attribute.issuing_attributes = issuing_attributes

  attribute
end

describe 'Yoti::Share::AttributeIssuanceDetails' do
  context 'with a valid thirdparty attribute' do
    let :token do
      'tokenValue'
    end
    let :b64token do
      Base64.encode64 token
    end
    let :now do
      DateTime.now
    end
    let :attribute do
      'attributeName'
    end
    let :proto do
      create_thirdparty_data_proto(token, now, attribute)
    end
    let :issuance_details do
      Yoti::Share::AttributeIssuanceDetails.new(proto)
    end

    it 'sets the attribute name' do
      expect(issuance_details.attributes.length).to eql 1
      expect(issuance_details.attributes[0].name).to eql attribute
    end
    it 'sets the token value' do
      expect(issuance_details.token).to eql b64token
    end
    it 'sets the expiry date' do
      expect(issuance_details.expiry_date).to eql now
    end
  end

  context 'with an invalid date' do
    it 'sets a nil value for date' do
    end
  end
end