# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-spinner'

module SampleCmdletPatterns
  module Commands
    # Multi spinner
    class SpinnerMulti < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute SpinnerMulti subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        spinners = TTY::Spinner::Multi.new('[:spinner] top')

        sp1 = spinners.register '[:spinner] one'
        # or sp1 = ::TTY::Spinner.new('[:spinner] one')
        sp2 = spinners.register '[:spinner] two'

        sp1.auto_spin
        sp2.auto_spin

        sleep(2) # Perform work

        sp1.success
        sp2.success

        :gui
      end
    end
  end
end
