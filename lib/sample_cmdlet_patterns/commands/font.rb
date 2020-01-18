# frozen_string_literal: true

require_relative '../command'
require_relative '../exit_app'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Command Name goes here
    class Font < SampleCmdletPatterns::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute Font command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @subcommand
          when :gui
            gui
          when :d3
            require_relative 'font_d3'
            subcmd = SampleCmdletPatterns::Commands::FontD3.new({})
          when :block
            require_relative 'font_block'
            subcmd = SampleCmdletPatterns::Commands::FontBlock.new({})
          when :doom
            require_relative 'font_doom'
            subcmd = SampleCmdletPatterns::Commands::FontDoom.new({})
          when :standard
            require_relative 'font_standard'
            subcmd = SampleCmdletPatterns::Commands::FontStandard.new({})
          when :starwars
            require_relative 'font_starwars'
            subcmd = SampleCmdletPatterns::Commands::FontStarwars.new({})
          when :straight
            require_relative 'font_straight'
            subcmd = SampleCmdletPatterns::Commands::FontStraight.new({})
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
          'd3',
          'block',
          'doom',
          'standard',
          'starwars',
          'straight',
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        begin
          prompt.on(:keyctrl_x, :keyescape) do
            raise ExitApp
          end

          subcommand = prompt.select('Select your subcommand (ESC to Exit)?', choices, per_page: 15, filter: true, cycle: true)

          command = SampleCmdletPatterns::Commands::Font.new(subcommand, {})
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
