# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-markdown'

module SampleCmdletPatterns
  module Commands
    # Simple markdown
    class MarkdownSimple < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute MarkdownSimple subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        markdown = <<~MARKDOWN
          Just some words

          # Heading 1

          ## Heading 2

          ### Heading 3

          #### Heading 4

          ##### Heading 5

          ***

          Just some words

          #### Link could go here

          [I'm an inline-style link](https://www.google.com)

          ## Or a block quote

          > Blockquotes are very handy in email to emulate reply text.
          > This line is part of the same quote.
          > *Oh*, you can put **Markdown** into a blockquote.

        MARKDOWN
        parsed = TTY::Markdown.parse(markdown)
        puts parsed

        :gui
      end
    end
  end
end
