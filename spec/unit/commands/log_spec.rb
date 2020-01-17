# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/log'

RSpec.describe SampleCmdletPatterns::Commands::Log do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Log.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `log` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
