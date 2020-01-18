# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # To read a single key stroke from the user use read_char or read_keypress
    class KeyReaderReadKeypress < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute KeyReaderReadKeypress subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        heading 'Press a key'
        puts reader.read_keypress

        :gui
      end
    end
  end
end
