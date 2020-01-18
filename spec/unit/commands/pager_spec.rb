# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/pager'

RSpec.describe SampleCmdletPatterns::Commands::Pager do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Pager.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `pager` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
