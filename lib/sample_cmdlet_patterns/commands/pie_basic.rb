# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-pie'

module SampleCmdletPatterns
  module Commands
    # basic
    class PieBasic < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute PieBasic subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        data = [
          { name: 'BTC', value: 5977, color: :bright_yellow, fill: '*' },
          { name: 'BCH', value: 3045, color: :bright_green, fill: 'x' },
          { name: 'LTC', value: 2030, color: :bright_magenta, fill: '@' },
          { name: 'ETH', value: 2350, color: :bright_cyan, fill: '+' }
        ]

        puts TTY::Pie.new(data: data, radius: 10)

        :gui
      end
    end
  end
end
