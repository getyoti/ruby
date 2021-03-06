# frozen_string_literal: true

module Yoti
  module DynamicSharingService
    # A Location Constraint
    class LocationConstraintExtension
      EXTENSION_TYPE = 'LOCATION_CONSTRAINT'

      # @return [#to_json]
      attr_reader :content

      # @return [String]
      attr_reader :type

      def initialize
        @content = {}
        @type = EXTENSION_TYPE
      end

      def as_json(*_args)
        {
          type: @type,
          content: @content
        }
      end

      def to_json(*_args)
        as_json.to_json
      end

      def self.builder
        LocationConstraintExtensionBuilder.new
      end
    end

    # Builder for LocationConstraintExtension
    class LocationConstraintExtensionBuilder
      def with_latitude(latitude)
        raise ArgumentError, 'Latitude must be Integer or Float'\
          unless latitude.is_a?(Integer) || latitude.is_a?(Float)
        raise ArgumentError, 'Latitude must be between -90 and 90'\
          unless latitude >= -90 && latitude <= 90

        @latitude = latitude
        self
      end

      def with_longitude(longitude)
        raise ArgumentError, 'Longitude must be Integer or Float'\
          unless longitude.is_a?(Integer) || longitude.is_a?(Float)
        raise ArgumentError, 'Longitude must be between -180 and 180'\
          unless longitude >= -180 && longitude <= 180

        @longitude = longitude
        self
      end

      def with_radius(radius)
        raise ArgumentError, 'Radius must be Integer or Float'\
          unless radius.is_a?(Integer) || radius.is_a?(Float)
        raise ArgumentError, 'Radius must be >= 0' unless radius >= 0

        @radius = radius
        self
      end

      def with_max_uncertainty(uncertainty)
        raise ArgumentError, 'Uncertainty must be Integer or Float'\
          unless uncertainty.is_a?(Integer) || uncertainty.is_a?(Float)
        raise ArgumentError, 'Uncertainty must be >= 0' unless uncertainty >= 0

        @uncertainty = uncertainty
        self
      end

      def build
        @radius ||= 150 unless @radius
        @uncertainty ||= 150 unless @uncertainty

        extension = LocationConstraintExtension.new
        extension.instance_variable_get(:@content)[:expected_device_location] = {
          latitude: @latitude,
          longitude: @longitude,
          radius: @radius,
          max_uncertainty_radius: @uncertainty
        }
        extension
      end
    end
  end
end
