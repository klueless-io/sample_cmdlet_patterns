# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/markdown'

RSpec.describe SampleCmdletPatterns::Commands::Markdown do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Markdown.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `markdown` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
