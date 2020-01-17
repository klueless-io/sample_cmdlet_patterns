# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-markdown'

module SampleCmdletPatterns
  module Commands
    # Markdown lists
    class MarkdownList < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute MarkdownList subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        markdown = <<~MARKDOWN
          - Item 1
            - Item 2
            - Item 3
              - Item 4
          - Item 5
        MARKDOWN
        parsed = TTY::Markdown.parse(markdown)
        puts parsed

        :gui
      end
    end
  end
end
