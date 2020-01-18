# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Opens a file or text in the users preferred editor.
    class EditorOpen < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute EditorOpen subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        heading 'open hello.rb in your chosen editor'
        editor.open('hello.rb')

        heading 'open content in your chosen editor'
        editor.open(content: 'some text')

        heading 'open hello.rb in vim'
        editor.open('hello.rb', command: :nano)

        # Currently does not support vscode

        :gui
      end
    end
  end
end
