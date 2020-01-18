# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # When the path to an executable program exists, an absolute path is returned, otherwise nil.
    class WhichWhich < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute WhichWhich subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        values = [
          ['less', which('less')],
          ['git', which('git')],
          ['ruby', which('ruby')],
          ['/usr/bin/ruby', which('/usr/bin/ruby')],
          ['ruby in limited paths', which('ruby', paths: ['/usr/local/bin', '/usr/bin', '/bin'])]
        ]

        pretty_table('Which paths', %w[key path], values)

        :gui
      end
    end
  end
end
