# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'
require 'tty-progressbar'

module SampleCmdletPatterns
  module Commands
    # Colorful progress bar
    class ProgressBarColorful < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute ProgressBarColorful subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt.ok('colorful progress bar')
        pastel = Pastel.new
        green  = pastel.on_green(" ")
        red    = pastel.on_red(" ")
        
        bar = TTY::ProgressBar.new("|:bar|",
          total: 30,
          complete: green,
          incomplete: red
        )

        30.times do
          sleep(0.1)
          bar.advance
        end

        :gui
      end
    end
  end
end
