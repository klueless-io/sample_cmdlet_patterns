# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Command Name goes here
    class Markdown < SampleCmdletPatterns::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute Markdown command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @subcommand
          when :gui
            gui
          when :simple
            require_relative 'markdown_simple'
            subcmd = SampleCmdletPatterns::Commands::MarkdownSimple.new({})
          when :list
            require_relative 'markdown_list'
            subcmd = SampleCmdletPatterns::Commands::MarkdownList.new({})
          when :code
            require_relative 'markdown_code'
            subcmd = SampleCmdletPatterns::Commands::MarkdownCode.new({})
          when :table
            require_relative 'markdown_table'
            subcmd = SampleCmdletPatterns::Commands::MarkdownTable.new({})
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
          'list',
          'code',
          'table',
          'q'
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        subcommand = prompt.select('Select your subcommand?', choices, per_page: 15, filter: true, cycle: true)

        command = SampleCmdletPatterns::Commands::Markdown.new(subcommand, {})
        command.execute(input: @input, output: @output)
      end
    end
  end
end
