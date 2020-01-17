# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Table of contents command
    class Toc < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute  command taking input from a input stream
      # and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        loop do
          case @command
          when :font
            require_relative 'font'
            cmd = SampleCmdletPatterns::Commands::Font.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :log
            require_relative 'log'
            cmd = SampleCmdletPatterns::Commands::Log.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :markdown
            require_relative 'markdown'
            cmd = SampleCmdletPatterns::Commands::Markdown.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :pie
            require_relative 'pie'
            cmd = SampleCmdletPatterns::Commands::Pie.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :progress_bar
            require_relative 'progress_bar'
            cmd = SampleCmdletPatterns::Commands::ProgressBar.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :prompt
            require_relative 'prompt'
            cmd = SampleCmdletPatterns::Commands::Prompt.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :spinner
            require_relative 'spinner'
            cmd = SampleCmdletPatterns::Commands::Spinner.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :table
            require_relative 'table'
            cmd = SampleCmdletPatterns::Commands::Table.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :q
            break
          else
            @command = gui
          end
          
        end
      end

      private

      def gui
        prompt = TTY::Prompt.new

        choices = [
          'font',
          'log',
          'markdown',
          'pie',
          'progress_bar',
          'prompt',
          'spinner',
          'table',
          'q'
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        command = prompt.select('Select your command?', choices, per_page: 15, filter: true, cycle: true)

        command.to_sym
      end
    end
  end
end
