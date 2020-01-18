# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'
require 'tty-link'

module SampleCmdletPatterns
  module Commands
    # TODO
    class ACommand < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute ACommand subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt.warn 'ToDO'
        prompt.ok TTY::Link.link_to('TTY-Command', 'https://www.rubydoc.info/gems/tty-command')

        :gui
      end
    end
  end
end
