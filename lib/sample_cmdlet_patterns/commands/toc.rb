# frozen_string_literal: true

require_relative '../command'
require_relative '../exit_app'

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
          when :a
            require_relative 'a'
            cmd = SampleCmdletPatterns::Commands::A.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :editor
            require_relative 'editor'
            cmd = SampleCmdletPatterns::Commands::Editor.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :font
            require_relative 'font'
            cmd = SampleCmdletPatterns::Commands::Font.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :key_reader
            require_relative 'key_reader'
            cmd = SampleCmdletPatterns::Commands::KeyReader.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :link
            require_relative 'link'
            cmd = SampleCmdletPatterns::Commands::Link.new('gui', {})
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
          when :platform
            require_relative 'platform'
            cmd = SampleCmdletPatterns::Commands::Platform.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :progress_bar
            require_relative 'progress_bar'
            cmd = SampleCmdletPatterns::Commands::ProgressBar.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :prompt
            require_relative 'prompt'
            cmd = SampleCmdletPatterns::Commands::Prompt.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :screen
            require_relative 'screen'
            cmd = SampleCmdletPatterns::Commands::Screen.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :spinner
            require_relative 'spinner'
            cmd = SampleCmdletPatterns::Commands::Spinner.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :table
            require_relative 'table'
            cmd = SampleCmdletPatterns::Commands::Table.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :which
            require_relative 'which'
            cmd = SampleCmdletPatterns::Commands::Which.new('gui', {})
            @command = cmd&.execute(input: input, output: output)
          when :exit
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
          'a',
          'editor',
          'font',
          'key_reader',
          'link',
          'log',
          'markdown',
          'pie',
          'platform',
          'progress_bar',
          'prompt',
          'screen',
          'spinner',
          'table',
          'which',
          # { name: :gui, disabled: '(:gui disabled, you are already on this menu)' }
        ]

        begin
          prompt.on(:keyctrl_x, :keyescape) do
            raise ExitApp
          end

          command = prompt.select('Select your command?', choices, per_page: 15, filter: true, cycle: true)

          command.to_sym
        rescue SampleCmdletPatterns::ExitApp
          puts
          puts
          prompt.warn 'exiting....'
          puts
          :exit
        end

      end
    end
  end
end
