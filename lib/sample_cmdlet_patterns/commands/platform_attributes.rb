# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # Allows you to detect operating system stats
    class PlatformAttributes < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute PlatformAttributes subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        values = [
          ['Platform CPU', platform.cpu],
          ['Platform OS', platform.os],
          ['Platform Version', platform.version],
          ['Platform - Windows?', platform.windows?],
          ['Platform - Unix?', platform.unix?],
          ['Platform - Linux?', platform.linux?],
          ['Platform - Mac?', platform.mac?],
        ]

        pretty_table('Operating system properites?', %w[title value], values)

        :gui
      end
    end
  end
end
