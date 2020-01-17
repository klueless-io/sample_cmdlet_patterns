# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'
require 'pastel'

module SampleCmdletPatterns
  module Commands
    # Block Font
    class FontBlock < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute FontBlock subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        message = 'Block-Head'
        puts message
        puts Pastel.new.red(TTY::Font.new(:block).write(message))

        :gui
      end
    end
  end
end
