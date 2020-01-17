# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-logger'

module SampleCmdletPatterns
  module Commands
    # Log simple messages
    class LogSimpleLog < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute LogSimpleLog subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        logger = TTY::Logger.new
        logger.info 'Deployed successfully'
        logger.info 'Deployed', 'successfully'
        logger.info { 'Dynamically generated info' }

        logger.success 'Include structured data', myapp: 'myapp', env: 'prod'

        :gui
      end
    end
  end
end
