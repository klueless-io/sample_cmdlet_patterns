# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-markdown'

module SampleCmdletPatterns
  module Commands
    # Markdown with code
    class MarkdownCode < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute MarkdownCode subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        name = 'Bobby'

        markdown = <<~MARKDOWN
          ```ruby
          class Greeter
            def hello(name)
              puts "Hello #{name}"
            end
          end
          ```
        MARKDOWN
        parsed = TTY::Markdown.parse(markdown)
        puts parsed

        :gui
      end
    end
  end
end
