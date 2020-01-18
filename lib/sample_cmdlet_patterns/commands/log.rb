# frozen_string_literal: true

require_relative '../command'
require_relative '../exit_app'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Command Name goes here
    class Log < SampleCmdletPatterns::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute Log command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @subcommand
          when :gui
            gui
          when :simple_log
            require_relative 'log_simple_log'
            subcmd = SampleCmdletPatterns::Commands::LogSimpleLog.new({})
          when :meta_data
            require_relative 'log_meta_data'
            subcmd = SampleCmdletPatterns::Commands::LogMetaData.new({})
          when :levels
            require_relative 'log_levels'
            subcmd = SampleCmdletPatterns::Commands::LogLevels.new({})
          when :exceptions
            require_relative 'log_exceptions'
            subcmd = SampleCmdletPatterns::Commands::LogExceptions.new({})
          when :types
            require_relative 'log_types'
            subcmd = SampleCmdletPatterns::Commands::LogTypes.new({})
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
          'simple_log',
          'meta_data',
          'levels',
          'exceptions',
          'types',
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        begin
          prompt.on(:keyctrl_x, :keyescape) do
            raise ExitApp
          end

          subcommand = prompt.select('Select your subcommand (ESC to Exit)?', choices, per_page: 15, filter: true, cycle: true)

          command = SampleCmdletPatterns::Commands::Log.new(subcommand, {})
          command.execute(input: @input, output: @output)
        rescue SampleCmdletPatterns::ExitApp
          puts
          prompt.warn 'go up one menu....'
          @subcommand = nil
        end
      end
    end
  end
end
