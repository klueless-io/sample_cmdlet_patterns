# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # bool
    class PromptBool < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute PromptBool subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        prompt.yes?('Are you a human?')

        prompt.yes?('Are you a human (yup/nope)?') do |q|
          q.suffix 'Yup/nope'
        end

        prompt.yes?('Are you a human (yup/nope) default Nope?') do |q|
          q.default false
          q.positive 'Yup'
          q.negative 'Nope'
        end

        prompt.yes?('Are you a human? suffix-->') do |q|
          q.suffix 'Agree/Disagree'
          q.positive 'Agree'
          q.negative 'Disagree'
          q.convert ->(input) { !input.match(/^agree$/i).nil? }
        end

        prompt.no?('Do you hate Ruby?, using NO command')

        :gui
      end
    end
  end
end
