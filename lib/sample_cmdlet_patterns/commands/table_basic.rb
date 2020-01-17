# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-table'

module SampleCmdletPatterns
  module Commands
    # Basic table
    class TableBasic < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute TableBasic subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        table = TTY::Table.new ['header1','header2'], [['a1', 'a2'], ['b1', 'b2']]

        puts "table.rows_size: #{table.rows_size}"
        puts "table.columns_size: #{table.columns_size}"
        puts "table.size: #{table.size}"

        heading 'basic'
        puts table.render(:basic)

        heading 'basic'
        puts 'ascii'
        puts table.render(:ascii)

        heading 'unicode'
        puts table.render(:unicode)

        :gui
      end
    end
  end
end
