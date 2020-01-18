# frozen_string_literal: true

require_relative '../command'
require_relative '../exit_app'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Command Name goes here
    class Cursor < SampleCmdletPatterns::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute Cursor command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @subcommand
          when :gui
            gui
          when :clear_move
            require_relative 'cursor_clear_move'
            subcmd = SampleCmdletPatterns::Commands::CursorClearMove.new({})
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
          'clear_move',
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        begin
          prompt.on(:keyctrl_x, :keyescape) do
            raise ExitApp
          end

          subcommand = prompt.select('Select your subcommand (ESC to Exit)?', choices, per_page: 15, filter: true, cycle: true)

          command = SampleCmdletPatterns::Commands::Cursor.new(subcommand, {})
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
