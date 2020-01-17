# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Multi row table
    class TableMultiline < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute TableMultiline subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        table = TTY::Table.new [ ["First", '1'], ["Multi\nLine\nContent", '2'], ["Third", '3']]
        puts table.render :ascii, multiline: true

        :gui
      end
    end
  end
end
