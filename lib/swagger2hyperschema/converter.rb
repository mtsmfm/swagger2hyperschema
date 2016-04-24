# frozen_string_literal: true
require 'yaml'
require 'json'

module Swagger2hyperschema
  class Converter
    def initialize(swagger_file)
      @swagger_file = swagger_file
    end

    def call
      json_schema = {
        '$schema' => 'http://json-schema.org/draft-04/hyper-schema',
        'type' => 'object',
        'links' => []
      }

      json_schema['links'] = swagger['paths'].flat_map {|endpoint, methods|
        methods.map {|method, link| convert_path_to_link(endpoint, method, link) }
      }.select {|link| link['targetSchema'] }

      json_schema['definitions'] = swagger['definitions']

      json_schema
    end

    private

    def convert_path_to_link(endpoint, method, link)
      {
        'description' => link['description'] || "#{method} #{endpoint}",
        'href' => swagger['basePath'].to_s + endpoint,
        'method' => method.upcase,
        'rel' => link['description'] || "#{method} #{endpoint}",
        'targetSchema' => link['responses'][200]['schema']
      }
    end

    def swagger
      return @swagger if defined? @swagger

      contents = @swagger_file.read

      @swagger = begin
        YAML.load(contents)
      rescue
        JSON.parse(contents)
      end
    end
  end
end
