# frozen_string_literal: true

require_relative '../command'

require 'tty-config'

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
          ['less', exec_exist?('less')],
          ['git', exec_exist?('git')],
          ['ruby', exec_exist?('ruby')],
          ['/usr/bin/ruby', exec_exist?('/usr/bin/ruby')],
          ['go', exec_exist?('go')],
          ['fred', exec_exist?('fred')]
        ]

        pretty_table('Paths Exist?', %w[key exists], values)

        :gui
      end
    end
  end
end
