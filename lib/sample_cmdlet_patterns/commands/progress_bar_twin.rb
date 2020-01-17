# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'
require 'tty-progressbar'

module SampleCmdletPatterns
  module Commands
    # Twin progress bar + total time bar
    class ProgressBarTwin < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute ProgressBarTwin subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        prompt.ok('twin progress bars')

        bars = TTY::ProgressBar::Multi.new("main [:bar] :percent")

        bar1 = bars.register("one [:bar] :percent", total: 15)
        bar2 = bars.register("two [:bar] :percent", total: 100)

        bars.start

        th1 = Thread.new { 15.times { sleep(0.1); bar1.advance } }
        th2 = Thread.new { 100.times { sleep(0.05); bar2.advance } }

        [th1, th2].each { |t| t.join }

        :gui
      end
    end
  end
end
