# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Columan padding
    class TablePadding < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute TablePadding subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        table = TTY::Table.new header: ['head1', 'head2']
        table << ["Multi\nLine", "Text\nthat\nwraps"]
        table << ["Some\nother\ntext", 'Simple']
        puts table.render :ascii, multiline: true, padding: [1,2,1,2]

        :gui
      end
    end
  end
end
