# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # By default read_multiline works in raw mode which means it behaves like a multiline editor that allows you to edit each character, respond to control characters such as Control-A to Control-B or navigate through history.
    class KeyReaderReadMultiline < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute KeyReaderReadMultiline subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        heading 'Read more than one line terminated by Ctrl+d or Ctrl+z'
        prompt.ok reader.read_multiline # => [ "line1", "line2", ... ]

        heading 'If you wish keystrokes to be interpreted by the terminal instead, set :raw option false'

        prompt.ok reader.read_line(raw: false)

        heading 'Need line prefixes'

        prompt.ok reader.read_multiline('>> ')

        :gui
      end
    end
  end
end
