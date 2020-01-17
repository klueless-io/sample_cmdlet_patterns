# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-logger'

module SampleCmdletPatterns
  module Commands
    # Custom log types
    class LogTypes < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute LogTypes subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        logger = TTY::Logger.new do |config|
          config.types = {
            thanks: {level: :info},
            done: {level: :info}
          }
          config.handlers = [
            [:console, {
              styles: {
                thanks: {
                  symbol: '❤️ ',
                  label: 'thanks',
                  color: :magenta,
                  levelpad: 0
                },
                done: {
                  symbol: '!!',
                  label: 'done',
                  color: :green,
                  levelpad: 2
                }
              }
            }]
          ]
        end

        logger.thanks('Great work!')
        logger.done('Work done!')

        :gui
      end
    end
  end
end
