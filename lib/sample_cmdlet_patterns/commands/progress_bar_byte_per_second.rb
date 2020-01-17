# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'
require 'tty-progressbar'

module SampleCmdletPatterns
  module Commands
    # Calculate Bytes per second with progress bar
    class ProgressBarBytePerSecond < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute ProgressBarBytePerSecond subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt.ok('Bytes per Second')
        bar = TTY::ProgressBar.new("[:bar] :byte_rate/s") do |config|
          config.total = 3000
          config.interval = 1     # => 1 sec
        end

        3000.times do
          sleep(0.001)
          bar.advance
        end

        :gui
      end
    end
  end
end
