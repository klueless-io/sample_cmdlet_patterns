# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # expand
    class PromptExpand < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute PromptExpand subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        choices = [
          {
            key: 'y',
            name: 'overwrite this file',
            value: :yes
          }, {
            key: 'n',
            name: 'do not overwrite this file',
            value: :no
          }, {
            key: 'q',
            name: 'quit; do not overwrite this file ',
            value: :quit
          }
        ]

        result = prompt.expand('Overwrite Gemfile?', choices)

        puts result

        result = prompt.expand('Overwrite Gemfile (with hint)?', choices, auto_hint: true)

        puts result

        result = prompt.expand('Overwrite Gemfile (via DSL)?') do |q|
          q.choice key: 'y', name: 'Overwrite'      do :ok end
          q.choice key: 'n', name: 'Skip',          value: :no
          q.choice key: 'a', name: 'Overwrite all', value: :all
          q.choice key: 'd', name: 'Show diff',     value: :diff
          q.choice key: 'q', name: 'Quit',          value: :quit
        end

        puts result

        :gui
      end
    end
  end
end
