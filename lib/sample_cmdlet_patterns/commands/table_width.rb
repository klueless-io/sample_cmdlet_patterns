# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Table width
    class TableWidth < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute TableWidth subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        header = ['h1', 'h2', 'h3']
        rows   = [['aaa1', 'aa2', 'aaaaaaa3'], ['b1', 'b2', 'b3']]
        table = TTY::Table.new header, rows
        puts table.render :unicode, width: 80, resize: true 

        :gui
      end
    end
  end
end
