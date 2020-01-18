# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Allows you to detect terminal screen size
    class ScreenAttributes < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute ScreenAttributes subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        values = [
          ['Screen size', screen.size],
          ['Screen width', screen.width],
          ['Screen [width] columns', screen.columns],
          ['Screen [width] cols', screen.cols],
          ['Screen height', screen.height],
          ['Screen [height] rows', screen.rows],
          ['Screen [height] lines', screen.lines],
        ]

        pretty_table('Screen Dimensions?', %w[title value], values)

        :gui
      end
    end
  end
end
