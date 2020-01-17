# frozen_string_literal: true

require 'thor'

module SampleCmdletPatterns
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'sample_cmdlet_patterns version'
    def version
      require_relative 'version'
      puts 'v' + SampleCmdletPatterns::VERSION
    end
    map %w[--version -v] => :version

    #
    # font
    #
    desc 'font SUBCOMMAND', 'Font - This is the main entry point to Font subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def font(subcommand = :gui)
      if options[:help]
        invoke :help, ['font']
      else
        require_relative 'commands/font'
        SampleCmdletPatterns::Commands::Font.new(subcommand, options).execute
      end
    end
    
    #
    # log
    #
    desc 'log SUBCOMMAND', 'Log - This is the main entry point to Log subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def log(subcommand = :gui)
      if options[:help]
        invoke :help, ['log']
      else
        require_relative 'commands/log'
        SampleCmdletPatterns::Commands::Log.new(subcommand, options).execute
      end
    end
    
    #
    # progress_bar
    #
    desc 'progress_bar SUBCOMMAND', 'Progress Bar - This is the main entry point to Progress Bar subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def progress_bar(subcommand = :gui)
      if options[:help]
        invoke :help, ['progress_bar']
      else
        require_relative 'commands/progress_bar'
        SampleCmdletPatterns::Commands::ProgressBar.new(subcommand, options).execute
      end
    end
    
    #
    # prompt
    #
    desc 'prompt SUBCOMMAND', 'Prompt - This is the main entry point to Prompt subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def prompt(subcommand = :gui)
      if options[:help]
        invoke :help, ['prompt']
      else
        require_relative 'commands/prompt'
        SampleCmdletPatterns::Commands::Prompt.new(subcommand, options).execute
      end
    end
  end
end
