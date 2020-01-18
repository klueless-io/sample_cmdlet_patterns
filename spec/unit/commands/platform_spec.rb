# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/platform'

RSpec.describe SampleCmdletPatterns::Commands::Platform do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Platform.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `platform` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
