# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-which'

module SampleCmdletPatterns
  module Commands
    # When you are only interesting in knowing that an executable exists on the system use the exist?
    class WhichExist < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute WhichExist subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        values = [
          ['less', TTY::Which.exist?('less')],
          ['git', TTY::Which.exist?('git')],
          ['ruby', TTY::Which.exist?('ruby')],
          ['/usr/bin/ruby', TTY::Which.exist?('/usr/bin/ruby')],
          ['go', TTY::Which.exist?('go')],
          ['fred', TTY::Which.exist?('fred')]
        ]

        pretty_table('Paths Exist?', %w[key exists], values)

        :gui
      end
    end
  end
end
