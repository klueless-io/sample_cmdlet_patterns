# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-font'
require 'pastel'

module SampleCmdletPatterns
  module Commands
    # D3 Font
    class FontD3 < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute FontD3 subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        message = 'In3D'
        puts message
        puts Pastel.new.yellow(TTY::Font.new('3d').write(message))

        :gui
      end
    end
  end
end
