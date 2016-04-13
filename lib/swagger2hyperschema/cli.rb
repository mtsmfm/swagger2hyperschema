# frozen_string_literal: true
require 'optparse'
require 'stringio'
require 'swagger2hyperschema/converter'

module Swagger2hyperschema
  class CLI
    def initialize(argv)
      @argv = argv
    end

    def call
      file = (File.open(@argv[0]) if File.exist?(@argv[0].to_s))

      return puts 'Usage: swagger2hyperschema FILE' unless file

      puts JSON.pretty_generate(Converter.new(file).call)
    end
  end
end
