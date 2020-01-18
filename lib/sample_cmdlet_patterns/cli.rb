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

    desc 'toc', 'Table of contents'
    def toc
      require_relative 'commands/toc'
      SampleCmdletPatterns::Commands::Toc.new({}).execute
    end
    map %w[--toc] => :toc

    #
    # a
    #
    desc 'a SUBCOMMAND', 'A - This is the main entry point to A subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def a(subcommand = :gui)
      if options[:help]
        invoke :help, ['a']
      else
        require_relative 'commands/a'
        SampleCmdletPatterns::Commands::A.new(subcommand, options).execute
      end
    end
    
    #
    # cursor
    #
    desc 'cursor SUBCOMMAND', 'Cursor - Terminal cursor movement and manipulation of cursor properties such as visibility'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def cursor(subcommand = :gui)
      if options[:help]
        invoke :help, ['cursor']
      else
        require_relative 'commands/cursor'
        SampleCmdletPatterns::Commands::Cursor.new(subcommand, options).execute
      end
    end
    
    #
    # editor
    #
    desc 'editor SUBCOMMAND', 'Editor - This is the main entry point to Editor subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def editor(subcommand = :gui)
      if options[:help]
        invoke :help, ['editor']
      else
        require_relative 'commands/editor'
        SampleCmdletPatterns::Commands::Editor.new(subcommand, options).execute
      end
    end
    
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
    # key_reader
    #
    desc 'key_reader SUBCOMMAND', 'Key Reader - Provides features necessary for building line editing and keyboard event processing in terminal applications!'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def key_reader(subcommand = :gui)
      if options[:help]
        invoke :help, ['key_reader']
      else
        require_relative 'commands/key_reader'
        SampleCmdletPatterns::Commands::KeyReader.new(subcommand, options).execute
      end
    end
    
    #
    # link
    #
    desc 'link SUBCOMMAND', 'Link - Allows you to test whether a terminal supports hyperlinks and print them to the console.'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def link(subcommand = :gui)
      if options[:help]
        invoke :help, ['link']
      else
        require_relative 'commands/link'
        SampleCmdletPatterns::Commands::Link.new(subcommand, options).execute
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
    # markdown
    #
    desc 'markdown SUBCOMMAND', 'Markdown - This is the main entry point to Markdown subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def markdown(subcommand = :gui)
      if options[:help]
        invoke :help, ['markdown']
      else
        require_relative 'commands/markdown'
        SampleCmdletPatterns::Commands::Markdown.new(subcommand, options).execute
      end
    end
    
    #
    # pager
    #
    desc 'pager SUBCOMMAND', 'Pager - This is the main entry point to Pager subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def pager(subcommand = :gui)
      if options[:help]
        invoke :help, ['pager']
      else
        require_relative 'commands/pager'
        SampleCmdletPatterns::Commands::Pager.new(subcommand, options).execute
      end
    end
    
    #
    # pie
    #
    desc 'pie SUBCOMMAND', 'Pie - This is the main entry point to Pie subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def pie(subcommand = :gui)
      if options[:help]
        invoke :help, ['pie']
      else
        require_relative 'commands/pie'
        SampleCmdletPatterns::Commands::Pie.new(subcommand, options).execute
      end
    end
    
    #
    # platform
    #
    desc 'platform SUBCOMMAND', 'Platform - Find out the properties of your operating system'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def platform(subcommand = :gui)
      if options[:help]
        invoke :help, ['platform']
      else
        require_relative 'commands/platform'
        SampleCmdletPatterns::Commands::Platform.new(subcommand, options).execute
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
    
    #
    # screen
    #
    desc 'screen SUBCOMMAND', 'Screen - Terminal screen size detection which works on Linux, OS X and Windows/Cygwin platforms and supports MRI, JRuby and Rubinius interpreters.'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def screen(subcommand = :gui)
      if options[:help]
        invoke :help, ['screen']
      else
        require_relative 'commands/screen'
        SampleCmdletPatterns::Commands::Screen.new(subcommand, options).execute
      end
    end
    
    #
    # spinner
    #
    desc 'spinner SUBCOMMAND', 'Spinner - This is the main entry point to Spinner subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def spinner(subcommand = :gui)
      if options[:help]
        invoke :help, ['spinner']
      else
        require_relative 'commands/spinner'
        SampleCmdletPatterns::Commands::Spinner.new(subcommand, options).execute
      end
    end
    
    #
    # table
    #
    desc 'table SUBCOMMAND', 'Table - This is the main entry point to Table subcommands'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def table(subcommand = :gui)
      if options[:help]
        invoke :help, ['table']
      else
        require_relative 'commands/table'
        SampleCmdletPatterns::Commands::Table.new(subcommand, options).execute
      end
    end
    
    #
    # which
    #
    desc 'which SUBCOMMAND', 'Which - Platform independent implementation of Unix which utility that searches for executable file in the path variable.'
    method_option :help, aliases: '-h',
                         type: :boolean,
                         desc: 'Display usage information'
    def which(subcommand = :gui)
      if options[:help]
        invoke :help, ['which']
      else
        require_relative 'commands/which'
        SampleCmdletPatterns::Commands::Which.new(subcommand, options).execute
      end
    end
  end
end
