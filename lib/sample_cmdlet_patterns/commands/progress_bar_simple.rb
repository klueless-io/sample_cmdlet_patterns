# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'
require 'tty-progressbar'

module SampleCmdletPatterns
  module Commands
    # Simple progress bar
    class ProgressBarSimple < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute ProgressBarSimple subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt.ok('simple progress bar')

        bar = TTY::ProgressBar.new("downloading [:bar]", total: 30)
        
        30.times do
          sleep(0.1)
          bar.advance(1)
        end

        :gui
      end
    end
  end
end
