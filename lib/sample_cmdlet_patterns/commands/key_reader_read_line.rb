# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # By default read_line works in raw mode which means it behaves like a line editor that allows you to edit each character, respond to control characters such as Control-A to Control-B or navigate through history.
    class KeyReaderReadLine < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute KeyReaderReadLine subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        heading 'Read characters until new line (try ^A and ^B)' # (responds to control characters such as Control-A to Control-B to navigate through history)'

        heading 'read_line'
        reader.read_line

        heading 'read_line(raw: false)'
        reader.read_line(raw: false)

        heading 'read_line(echo: false)'
        reader.read_line(echo: false)

        heading 'read_line(":):):) >>>>> ")'
        reader.read_line(':):):) >>>>>  ')

        heading 'read_line("> ", value: "edit me")'
        reader.read_line('> ', value: 'edit me')

        :gui
      end
    end
  end
end
