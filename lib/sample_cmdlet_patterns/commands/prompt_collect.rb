# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # collect
    class PromptCollect < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute PromptCollect subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        result = prompt.collect do
          key(:name).ask('Name?')

          key(:age).ask('Age?', convert: :int, required: true)

          key(:address) do
            key(:street).ask('Street?', required: true)
            key(:city).ask('City?')
            key(:zip).ask('Zip?', validate: /\A\d{3}\Z/)
          end
        end

        puts result

        result = prompt.collect do
          key(:name).ask('Name?')

          key(:age).ask('Age?', convert: :int)

          while prompt.yes?('continue, add many addresses?')
            key(:addresses).values do
              key(:street).ask('Street?', required: true)
              key(:city).ask('City?')
              key(:zip).ask('Zip?', validate: /\A\d{3}\Z/)
            end
          end
        end

        puts result

        :gui
      end
    end
  end
end
