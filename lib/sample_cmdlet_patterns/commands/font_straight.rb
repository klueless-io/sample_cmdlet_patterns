# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-font'
require 'pastel'

module SampleCmdletPatterns
  module Commands
    # Straight Font
    class FontStraight < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute FontStraight subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        message = 'straight'
        puts message
        puts Pastel.new.red(TTY::Font.new(:straight).write(message))

        :gui
      end
    end
  end
end
