# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'
require 'tty-reader'

module SampleCmdletPatterns
  module Commands
    # You can register to listen on a key pressed events. This can be done by calling on with a event name(s)
    class KeyReaderOn < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute KeyReaderOn subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        heading 'Only press [a,s,d,f or x]'

        reader = TTY::Reader.new

        exiting = false

        reader.on(:keypress) do |event|
          prompt.say event.value if event.value == 'a'
          prompt.warn event.value if event.value == 's'
          prompt.error event.value if event.value == 'd'
          prompt.ok event.value if event.value == 'f'

          if event.value == 'x'
            prompt.warn 'e[x]iting....'
            exiting = true
          end
        end

        until exiting do reader.read_keypress end

        heading 'Press any key or ^x or Esc to exit'

        reader = TTY::Reader.new

        exiting = false

        reader.on(:keypress) do |event|
          puts event.value
        end
        reader.on(:keyctrl_x, :keyescape) do
          prompt.warn 'e[x]iting....'
          exiting = true
        end

        until exiting do reader.read_keypress end

        :gui
      end
    end
  end
end
