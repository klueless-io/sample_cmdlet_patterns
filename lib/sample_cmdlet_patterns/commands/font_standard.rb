# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-font'
require 'pastel'

module SampleCmdletPatterns
  module Commands
    # Standard Font
    class FontStandard < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute FontStandard subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        message = 'Standard'
        puts message
        puts Pastel.new.green(TTY::Font.new(:standard).write(message))

        :gui
      end
    end
  end
end
