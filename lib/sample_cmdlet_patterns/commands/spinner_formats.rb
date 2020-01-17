# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-spinner'

module SampleCmdletPatterns
  module Commands
    #  spinner
    class SpinnerFormats < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute SpinnerFormats subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        spinners = TTY::Spinner::Multi.new("[:spinner] top", format: :classic)

        puts '-' * 70
        puts 'SET 1'
        puts '-' * 70
        sp01 = spinners.register "[:spinner] 01", format: :classic
        sp02 = spinners.register "[:spinner] 02", format: :spin
        sp03 = spinners.register "[:spinner] 03", format: :spin_2
        sp04 = spinners.register "[:spinner] 04", format: :spin_3
        sp05 = spinners.register "[:spinner] 05", format: :spin_4
        sp06 = spinners.register "[:spinner] 06", format: :pulse
        sp07 = spinners.register "[:spinner] 07", format: :pulse_2
        sp08 = spinners.register "[:spinner] 08", format: :pulse_3
        sp09 = spinners.register "[:spinner] 09", format: :dots
        sp10 = spinners.register "[:spinner] 10", format: :dots_2
        sp11 = spinners.register "[:spinner] 11", format: :dots_3
        sp12 = spinners.register "[:spinner] 12", format: :dots_4
        sp13 = spinners.register "[:spinner] 13", format: :dots_5
        sp14 = spinners.register "[:spinner] 14", format: :dots_6
        sp15 = spinners.register "[:spinner] 15", format: :dots_7
        sp16 = spinners.register "[:spinner] 16", format: :dots_8
        sp17 = spinners.register "[:spinner] 17", format: :dots_9
        sp18 = spinners.register "[:spinner] 18", format: :dots_10
        sp19 = spinners.register "[:spinner] 19", format: :dots_11

        sp01.auto_spin
        sp02.auto_spin
        sp03.auto_spin
        sp04.auto_spin
        sp05.auto_spin
        sp06.auto_spin
        sp07.auto_spin
        sp08.auto_spin
        sp09.auto_spin
        sp10.auto_spin
        sp11.auto_spin
        sp12.auto_spin
        sp13.auto_spin
        sp14.auto_spin
        sp15.auto_spin
        sp16.auto_spin
        sp17.auto_spin
        sp18.auto_spin
        sp19.auto_spin

        sleep(4)

        sp01.success
        sp02.success
        sp03.success
        sp04.success
        sp05.success
        sp06.success
        sp07.success
        sp08.success
        sp09.success
        sp10.success
        sp11.success
        sp12.success
        sp13.success
        sp14.success
        sp15.success
        sp16.success
        sp17.success
        sp18.success
        sp19.success

        sleep(2)

        puts '-' * 70
        puts 'SET 2'
        puts '-' * 70

        sp20 = spinners.register "[:spinner] 20", format: :arrow
        sp21 = spinners.register "[:spinner] 21", format: :arrow_pulse
        sp22 = spinners.register "[:spinner] 22", format: :triangle
        sp23 = spinners.register "[:spinner] 23", format: :arc
        sp24 = spinners.register "[:spinner] 24", format: :pipe
        sp25 = spinners.register "[:spinner] 25", format: :bouncing
        sp26 = spinners.register "[:spinner] 26", format: :bouncing_ball
        sp27 = spinners.register "[:spinner] 27", format: :bounce
        sp28 = spinners.register "[:spinner] 28", format: :box_bounce
        sp29 = spinners.register "[:spinner] 29", format: :box_bounce_2

        sp20.auto_spin
        sp21.auto_spin
        sp22.auto_spin
        sp23.auto_spin
        sp24.auto_spin
        sp25.auto_spin
        sp26.auto_spin
        sp27.auto_spin
        sp28.auto_spin
        sp29.auto_spin

        sleep(4)

        sp20.success
        sp21.success
        sp22.success
        sp23.success
        sp24.success
        sp25.success
        sp26.success
        sp27.success
        sp28.success
        sp29.success

        sleep(2)

        puts '-' * 70
        puts 'SET 3'
        puts '-' * 70

        sp30 = spinners.register "[:spinner] 20", format: :star
        sp31 = spinners.register "[:spinner] 31", format: :toggle
        sp32 = spinners.register "[:spinner] 32", format: :balloon
        sp33 = spinners.register "[:spinner] 33", format: :balloon_2
        sp34 = spinners.register "[:spinner] 34", format: :flip
        sp35 = spinners.register "[:spinner] 35", format: :burger
        sp36 = spinners.register "[:spinner] 36", format: :dance
        sp37 = spinners.register "[:spinner] 37", format: :shark
        sp38 = spinners.register "[:spinner] 38", format: :pong

        sp30.auto_spin
        sp31.auto_spin
        sp32.auto_spin
        sp33.auto_spin
        sp34.auto_spin
        sp35.auto_spin
        sp36.auto_spin
        sp37.auto_spin
        sp38.auto_spin

        sleep(4)

        sp30.success
        sp31.success
        sp32.success
        sp33.success
        sp34.success
        sp35.success
        sp36.success
        sp37.success
        sp38.success

        :gui
      end
    end
  end
end
