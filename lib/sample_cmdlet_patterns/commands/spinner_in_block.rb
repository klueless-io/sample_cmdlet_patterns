# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-spinner'

module SampleCmdletPatterns
  module Commands
    #  spinner
    class SpinnerInBlock < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute SpinnerInBlock subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        spinner = TTY::Spinner.new
        spinner.run('Done!') do |spinner|
          puts 'running some long code'
          sleep(3)
        end

        :gui
      end
    end
  end
end
