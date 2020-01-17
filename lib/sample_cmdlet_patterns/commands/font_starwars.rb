# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-font'
require 'pastel'

module SampleCmdletPatterns
  module Commands
    # Starwars Font
    class FontStarwars < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute FontStarwars subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        message = 'Starwars'
        puts message
        puts Pastel.new.red(TTY::Font.new(:starwars).write(message))

        :gui
      end
    end
  end
end
