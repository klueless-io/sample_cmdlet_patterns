# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-markdown'

module SampleCmdletPatterns
  module Commands
    # Markdown with tables
    class MarkdownTable < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute MarkdownTable subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        markdown = <<~MARKDOWN
          | Tables   |      Are      |  Cool |
          |----------|:-------------:|------:|
          | col 1 is |  left-aligned | $1600 |
          | col 2 is |    centered   |   $12 |
          | col 3 is | right-aligned |    $1 |
        MARKDOWN
        parsed = TTY::Markdown.parse(markdown)
        puts parsed

        :gui
      end
    end
  end
end
