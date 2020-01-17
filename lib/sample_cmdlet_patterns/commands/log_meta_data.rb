# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-logger'

module SampleCmdletPatterns
  module Commands
    # Log with meta data
    class LogMetaData < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute LogMetaData subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        logger = TTY::Logger.new do |config|
          config.metadata = [:date, :time]
        end
        logger.success 'Include structured data', myapp: 'myapp', env: 'prod'

        logger = TTY::Logger.new do |config|
          config.formatter = :json
        end
        logger.info 'Deployed successfully'
        logger.success 'Include structured data', myapp: 'myapp', env: 'prod'

        :gui
      end
    end
  end
end
