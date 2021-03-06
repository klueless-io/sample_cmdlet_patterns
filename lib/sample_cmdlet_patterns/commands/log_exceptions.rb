# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-logger'

module SampleCmdletPatterns
  module Commands
    # Log exceptions
    class LogExceptions < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute LogExceptions subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        logger = TTY::Logger.new
        begin
          raise ArgumentError, 'Wrong data'
        rescue ArgumentError => e
          logger.fatal('Error:', e)
        end

        :gui
      end
    end
  end
end
