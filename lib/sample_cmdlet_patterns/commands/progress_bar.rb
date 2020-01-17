# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Command Name goes here
    class ProgressBar < SampleCmdletPatterns::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute ProgressBar command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @subcommand
          when :gui
            gui
          when :simple
            require_relative 'progress_bar_simple'
            subcmd = SampleCmdletPatterns::Commands::ProgressBarSimple.new({})
          when :twin
            require_relative 'progress_bar_twin'
            subcmd = SampleCmdletPatterns::Commands::ProgressBarTwin.new({})
          when :colorful
            require_relative 'progress_bar_colorful'
            subcmd = SampleCmdletPatterns::Commands::ProgressBarColorful.new({})
          when :byte_per_second
            require_relative 'progress_bar_byte_per_second'
            subcmd = SampleCmdletPatterns::Commands::ProgressBarBytePerSecond.new({})
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
          'twin',
          'colorful',
          'byte_per_second',
          'q'
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        subcommand = prompt.select('Select your subcommand?', choices, per_page: 15, filter: true, cycle: true)

        command = SampleCmdletPatterns::Commands::ProgressBar.new(subcommand, {})
        command.execute(input: @input, output: @output)
      end
    end
  end
end
