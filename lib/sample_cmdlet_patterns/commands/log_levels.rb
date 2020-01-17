# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-logger'

module SampleCmdletPatterns
  module Commands
    # Logging levels
    class LogLevels < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute LogLevels subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        logger.debug    'logs message at :debug level'
        logger.info     'logs message at :info level'
        logger.success  'logs message at :info level'
        logger.wait     'logs message at :info level'
        logger.warn     'logs message at :warn level'
        logger.error    'logs message at :error level'
        logger.fatal    'logs message at :fatal level'

        :gui
      end
    end
  end
end
