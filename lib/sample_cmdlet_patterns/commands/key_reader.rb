# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Command Name goes here
    class KeyReader < SampleCmdletPatterns::Command
      def initialize(subcommand, options)
        @subcommand = (subcommand || '').to_sym

        @options = options
      end

      # Execute KeyReader command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @subcommand
          when :gui
            gui
          when :read_keypress
            require_relative 'key_reader_read_keypress'
            subcmd = SampleCmdletPatterns::Commands::KeyReaderReadKeypress.new({})
          when :read_line
            require_relative 'key_reader_read_line'
            subcmd = SampleCmdletPatterns::Commands::KeyReaderReadLine.new({})
          when :read_multiline
            require_relative 'key_reader_read_multiline'
            subcmd = SampleCmdletPatterns::Commands::KeyReaderReadMultiline.new({})
          when :on
            require_relative 'key_reader_on'
            subcmd = SampleCmdletPatterns::Commands::KeyReaderOn.new({})
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
          'read_keypress',
          'read_line',
          'read_multiline',
          'on',
          'q'
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        subcommand = prompt.select('Select your subcommand?', choices, per_page: 15, filter: true, cycle: true)

        command = SampleCmdletPatterns::Commands::KeyReader.new(subcommand, {})
        command.execute(input: @input, output: @output)
      end
    end
  end
end
