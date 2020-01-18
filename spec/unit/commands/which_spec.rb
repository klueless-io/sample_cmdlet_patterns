# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/which'

RSpec.describe SampleCmdletPatterns::Commands::Which do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Which.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `which` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
