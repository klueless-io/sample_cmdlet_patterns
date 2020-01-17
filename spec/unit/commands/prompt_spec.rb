# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/prompt'

RSpec.describe SampleCmdletPatterns::Commands::Prompt do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Prompt.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `prompt` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
