# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Command Name goes here
    class Prompt < SampleCmdletPatterns::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute Prompt command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @subcommand
          when :gui
            gui
          when :bool
            require_relative 'prompt_bool'
            subcmd = SampleCmdletPatterns::Commands::PromptBool.new({})
          when :collect
            require_relative 'prompt_collect'
            subcmd = SampleCmdletPatterns::Commands::PromptCollect.new({})
          when :expand
            require_relative 'prompt_expand'
            subcmd = SampleCmdletPatterns::Commands::PromptExpand.new({})
          when :keypress
            require_relative 'prompt_keypress'
            subcmd = SampleCmdletPatterns::Commands::PromptKeypress.new({})
          when :menu
            require_relative 'prompt_menu'
            subcmd = SampleCmdletPatterns::Commands::PromptMenu.new({})
          when :multi_line
            require_relative 'prompt_multi_line'
            subcmd = SampleCmdletPatterns::Commands::PromptMultiLine.new({})
          when :multi_select
            require_relative 'prompt_multi_select'
            subcmd = SampleCmdletPatterns::Commands::PromptMultiSelect.new({})
          when :say
            require_relative 'prompt_say'
            subcmd = SampleCmdletPatterns::Commands::PromptSay.new({})
          when :slider
            require_relative 'prompt_slider'
            subcmd = SampleCmdletPatterns::Commands::PromptSlider.new({})
          when :suggest
            require_relative 'prompt_suggest'
            subcmd = SampleCmdletPatterns::Commands::PromptSuggest.new({})
          when :validation
            require_relative 'prompt_validation'
            subcmd = SampleCmdletPatterns::Commands::PromptValidation.new({})
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
          'bool',
          'collect',
          'expand',
          'keypress',
          'menu',
          'multi_line',
          'multi_select',
          'say',
          'slider',
          'suggest',
          'validation',
          'q'
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        subcommand = prompt.select('Select your subcommand?', choices, per_page: 15, filter: true, cycle: true)

        command = SampleCmdletPatterns::Commands::Prompt.new(subcommand, {})
        command.execute(input: @input, output: @output)
      end
    end
  end
end
