# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # keypress
    class PromptKeypress < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute PromptKeypress subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        prompt.keypress('Press key ?')

        prompt.keypress('Press space or enter to continue', keys: [:space, :return])

        prompt.keypress('Press any key to continue, resumes automatically in 3 seconds ...', timeout: 3)

        prompt.keypress('Press any key to continue, resumes automatically in :countdown ...', timeout: 3)

        :gui
      end
    end
  end
end
