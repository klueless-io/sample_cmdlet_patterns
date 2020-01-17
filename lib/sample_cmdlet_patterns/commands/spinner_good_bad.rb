# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-spinner'

module SampleCmdletPatterns
  module Commands
    #  spinner
    class SpinnerGoodBad < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute SpinnerGoodBad subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        spinner = TTY::Spinner.new('[:spinner] Task name')
        spinner.auto_spin
        sleep(1)
        spinner.success('(successful)')

        spinner = TTY::Spinner.new('[:spinner] Task name')
        spinner.auto_spin
        sleep(1)
        spinner.error('(error)')

        :gui
      end
    end
  end
end
