# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Column aligned table
    class TableAlign < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute TableAlign subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        heading 'column alignment'
        table = TTY::Table.new ['header1','header2','header3'], [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], ['b1', 'c2', 'c3']]

        puts table.render :unicode, alignments: [:left, :center, :right]

        heading 'custom alignment'
        table = TTY::Table.new header: ['header1', 'header2']
        table << [{value: 'a1', alignment: :right}, 'a2']
        table << ['b1', {value: 'b2', alignment: :center}]

        puts table.render :unicode

        :gui
      end
    end
  end
end
