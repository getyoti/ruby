# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: IssuingAttributes.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "sharepubapi_v1.IssuingAttributes" do
    optional :expiry_date, :string, 1
    repeated :definitions, :message, 2, "sharepubapi_v1.Definition"
  end
  add_message "sharepubapi_v1.Definition" do
    optional :name, :string, 1
  end
end

module Yoti
  module Protobuf
    module Sharepubapi
      IssuingAttributes = Google::Protobuf::DescriptorPool.generated_pool.lookup("sharepubapi_v1.IssuingAttributes").msgclass
      Definition = Google::Protobuf::DescriptorPool.generated_pool.lookup("sharepubapi_v1.Definition").msgclass
    end
  end
end
