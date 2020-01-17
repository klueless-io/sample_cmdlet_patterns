# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Command Name goes here
    class Table < SampleCmdletPatterns::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute Table command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @subcommand
          when :gui
            gui
          when :basic
            require_relative 'table_basic'
            subcmd = SampleCmdletPatterns::Commands::TableBasic.new({})
          when :align
            require_relative 'table_align'
            subcmd = SampleCmdletPatterns::Commands::TableAlign.new({})
          when :multiline
            require_relative 'table_multiline'
            subcmd = SampleCmdletPatterns::Commands::TableMultiline.new({})
          when :padding
            require_relative 'table_padding'
            subcmd = SampleCmdletPatterns::Commands::TablePadding.new({})
          when :width
            require_relative 'table_width'
            subcmd = SampleCmdletPatterns::Commands::TableWidth.new({})
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
          'basic',
          'align',
          'multiline',
          'padding',
          'width',
          'q'
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        subcommand = prompt.select('Select your subcommand?', choices, per_page: 15, filter: true, cycle: true)

        command = SampleCmdletPatterns::Commands::Table.new(subcommand, {})
        command.execute(input: @input, output: @output)
      end
    end
  end
end
