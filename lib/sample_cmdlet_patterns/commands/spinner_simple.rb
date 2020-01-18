# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-spinner'

module SampleCmdletPatterns
  module Commands
    # Many spinner formats
    class SpinnerSimple < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute SpinnerSimple subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        spinner = TTY::Spinner.new
        spinner.auto_spin # Automatic animation with default interval
        sleep(2) # Perform task
        spinner.stop('Done!') # Stop animation

        spinner = TTY::Spinner.new('[:spinner] Loading ...', format: :pulse_2)
        spinner.auto_spin # Automatic animation with default interval
        sleep(2) # Perform task
        spinner.stop('Done!') # Stop animation

        :gui
      end
    end
  end
end
