# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'

module SampleCmdletPatterns
  module Commands
    # multi_select
    class PromptMultiSelect < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute PromptMultiSelect subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        choices = %w[vodka beer wine whisky bourbon]
        puts prompt.multi_select('Select drinks?', choices)

        choices = { vodka: 1, beer: 2, wine: 3, whisky: 4, bourbon: 5}
        puts prompt.multi_select('Select drinks (return enum values)?', choices)

        # NOT WORKING
        # puts prompt.multi_select('Select drinks?') do |menu|
        #   menu.choice :vodka, {score: 1}
        #   menu.choice :beer, 2
        #   menu.choice :wine, 3
        #   # menu.choices whisky: 4, bourbon: 5
        # end

        # NOT WORKING
        # puts prompt.multi_select('Select drinks?') do |menu|
        #   menu.default 2, 5

        #   menu.choice :vodka,   {score: 10}
        #   menu.choice :beer,    {score: 20}
        #   menu.choice :wine,    {score: 30}
        #   menu.choice :whisky,  {score: 40}
        #   menu.choice :bourbon, {score: 50}
        # end

        # NOT WORKING
        # puts prompt.multi_select('Select drinks?') do |menu|
        #   menu.enum ')'

        #   menu.choice :vodka,   {score: 10}
        #   menu.choice :beer,    {score: 20}
        #   menu.choice :wine,    {score: 30}
        #   menu.choice :whisky,  {score: 40}
        #   menu.choice :bourbon, {score: 50}
        # end

        puts prompt.multi_select('Select drinks (can cycle)?', %w[vodka beer wine], cycle: true)

        choices = { vodka: 1, beer: 2, wine: 3, whisky: 4, bourbon: 5 }
        puts prompt.multi_select('Select drinks (see help-->)?', choices, help: 'This is where I can be very helpful')

        letters = ('A'..'Z').to_a
        prompt.multi_select('Choose your letter (paginated)?', letters, per_page: 4)

        drinks = [
          'bourbon',
          { name: 'sake', disabled: '(out of stock)' },
          'vodka',
          { name: 'beer', disabled: '(out of stock)' },
          'wine',
          'whisky'
        ]
        prompt.multi_select('Choose your favourite drink (some are disabled)?', drinks)

        choices = %w[vodka beer wine whisky bourbon]
        prompt.multi_select('Select drinks (no echo to the right)?', choices, echo: false)

        choices = %w[vodka beer wine whisky bourbon]
        prompt.multi_select('Select drinks (typeahead is supported)?', choices, filter: true)

        choices = %w[vodka beer wine whisky bourbon]
        prompt.multi_select('Select drinks (only 2 to choose from)?', choices, max: 2)

        choices = %w[vscode emacs nano vim]
        prompt.enum_select('Select an editor (enum)?', choices)

        # NOT WORKING
        # choices = %w[vscode nano vim emacs]
        # puts prompt.enum_select('Select an editor?') do |menu|
        #   menu.choice :vscode, '/bin/code'
        #   menu.choice :nano, '/bin/nano'
        #   menu.choice :vim, '/usr/bin/vim'
        #   menu.choice :emacs, '/usr/bin/emacs'
        # end

        # NOT WORKING
        # choices = %w[vscode nano vim emacs]
        # prompt.enum_select('Select an editor?') do |menu|
        #   menu.default 3
        #   menu.enum '.'

        #   menu.choice :vscode, '/bin/code'
        #   menu.choice :nano, '/bin/nano'
        #   menu.choice :vim, '/usr/bin/vim'
        #   menu.choice :emacs, '/usr/bin/emacs'
        # end

        :gui
      end
    end
  end
end
