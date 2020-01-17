# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-font'
require 'pastel'

module SampleCmdletPatterns
  module Commands
    # Doom Font
    class FontDoom < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute FontDoom subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        message = 'DOOM!'
        puts message
        font = TTY::Font.new(:doom)
        puts font.write(message)
        puts font.write(message, letter_spacing: 4)

        :gui
      end
    end
  end
end
