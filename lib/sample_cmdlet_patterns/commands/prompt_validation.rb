# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # validation
    class PromptValidation < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute PromptValidation subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        prompt.ask('What is your username (aaaa.bbbb)?') do |q|
          q.validate /^[^\.]+\.[^\.]+/
        end

        prompt.ask('What is your username (aaaa.bbbb)?') do |q|
          q.validate { |input| input =~ /^[^\.]+\.[^\.]+/ }
        end

        prompt.ask('What is your email?') { |q| q.validate :email }

        :gui
      end
    end
  end
end
