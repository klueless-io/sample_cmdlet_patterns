# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Command Name goes here
    class Spinner < SampleCmdletPatterns::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute Spinner command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @subcommand
          when :gui
            gui
          when :simple
            require_relative 'spinner_simple'
            subcmd = SampleCmdletPatterns::Commands::SpinnerSimple.new({})
          when :multi
            require_relative 'spinner_multi'
            subcmd = SampleCmdletPatterns::Commands::SpinnerMulti.new({})
          when :in_block
            require_relative 'spinner_in_block'
            subcmd = SampleCmdletPatterns::Commands::SpinnerInBlock.new({})
          when :good_bad
            require_relative 'spinner_good_bad'
            subcmd = SampleCmdletPatterns::Commands::SpinnerGoodBad.new({})
          when :formats
            require_relative 'spinner_formats'
            subcmd = SampleCmdletPatterns::Commands::SpinnerFormats.new({})
          else
            break
          end
          @subcommand = subcmd&.execute(input: input, output: output)
        end
      end

      private

      def gui
        prompt = TTY::Prompt.new

        choices = [
          'simple',
          'multi',
          'in_block',
          'good_bad',
          'formats',
          'q'
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        subcommand = prompt.select('Select your subcommand?', choices, per_page: 15, filter: true, cycle: true)

        command = SampleCmdletPatterns::Commands::Spinner.new(subcommand, {})
        command.execute(input: @input, output: @output)
      end
    end
  end
end
