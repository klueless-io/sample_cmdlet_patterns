# frozen_string_literal: true

# require_relative 'sample_cmdlet_patterns/version'

require 'sample_cmdlet_patterns/commands/toc'

require 'sample_cmdlet_patterns/commands/font'
require 'sample_cmdlet_patterns/commands/log'
require 'sample_cmdlet_patterns/commands/markdown'
require 'sample_cmdlet_patterns/commands/pie'
require 'sample_cmdlet_patterns/commands/progress_bar'
require 'sample_cmdlet_patterns/commands/prompt'
require 'sample_cmdlet_patterns/commands/spinner'
require 'sample_cmdlet_patterns/commands/table'

module SampleCmdletPatterns
  class Error < StandardError; end
  # Your code goes here...
end
