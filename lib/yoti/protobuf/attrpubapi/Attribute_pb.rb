# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: Attribute.proto

require 'google/protobuf'

require 'ContentType_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "attrpubapi_v1.Attribute" do
    optional :name, :string, 1
    optional :value, :bytes, 2
    optional :content_type, :enum, 3, "attrpubapi_v1.ContentType"
    repeated :anchors, :message, 4, "attrpubapi_v1.Anchor"
  end
  add_message "attrpubapi_v1.Anchor" do
    optional :artifact_link, :bytes, 1
    repeated :origin_server_certs, :bytes, 2
    optional :artifact_signature, :bytes, 3
    optional :sub_type, :string, 4
    optional :signature, :bytes, 5
    optional :signed_time_stamp, :bytes, 6
  end
  add_message "attrpubapi_v1.MultiValue" do
    repeated :values, :message, 1, "attrpubapi_v1.MultiValue.Value"
  end
  add_message "attrpubapi_v1.MultiValue.Value" do
    optional :content_type, :enum, 1, "attrpubapi_v1.ContentType"
    optional :data, :bytes, 2
  end
end

module Yoti
  module Protobuf
    module Attrpubapi
      Attribute = Google::Protobuf::DescriptorPool.generated_pool.lookup("attrpubapi_v1.Attribute").msgclass
      Anchor = Google::Protobuf::DescriptorPool.generated_pool.lookup("attrpubapi_v1.Anchor").msgclass
      MultiValue = Google::Protobuf::DescriptorPool.generated_pool.lookup("attrpubapi_v1.MultiValue").msgclass
      MultiValue::Value = Google::Protobuf::DescriptorPool.generated_pool.lookup("attrpubapi_v1.MultiValue.Value").msgclass
    end
  end
end
