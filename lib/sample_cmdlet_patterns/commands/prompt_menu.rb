# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # menu
    class PromptMenu < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute PromptMenu subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt = TTY::Prompt.new

        choices = %w[small medium large]

        heading prompt.select('What size? (simple)', choices)

        choices = { small: 1, medium: 2, large: 3 }

        heading prompt.select('What size? (key/value)', choices)

        choices = [
          { name: 'small', value: 1 },
          { name: 'medium', value: 2, disabled: '(out of stock)' },
          { name: 'large', value: 3 }
        ]

        heading prompt.select('What size? (json config)', choices)

        result = prompt.select('What size? (dsl)') do |menu|
          menu.choice name: 'small',  value: 1
          menu.choice name: 'medium', value: 2, disabled: '(out of stock)'
          menu.choice name: 'large',  value: 3
        end

        heading result

        result = prompt.select('Choose your destiny (custom value via proc)?') do |menu|
          menu.choice 'Scorpion', 1
          menu.choice 'Kano', 2
          menu.choice 'Jax', -> { 'Nice choice captain!' }
        end

        heading result

        result = prompt.select('Choose your destiny (default)?') do |menu|
          menu.default 3

          menu.choice 'Scorpion', 1
          menu.choice 'Kano', 2
          menu.choice 'Jax', 3
        end

        heading result

        heading prompt.select('Choose your destiny (cycle)?', %w(Scorpion Kano Jax), cycle: true)

        prompt.select('Choose your destiny (extra config)?', %w(Scorpion Kano Jax), help: '(Bash keyboard)', symbols: {marker: '>'})

        :gui
      end
    end
  end
end
