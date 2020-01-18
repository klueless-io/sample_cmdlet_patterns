# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-link'

module SampleCmdletPatterns
  module Commands
    # To print hyperlink in your terminal
    class LinkHyperlink < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute LinkHyperlink subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt.ok TTY::Link.link_to('Klueless IO', 'https://klueless.io/')
        prompt.say 'Click command+mouse click to open hyperlink'

        :gui
      end
    end
  end
end
