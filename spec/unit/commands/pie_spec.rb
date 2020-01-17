# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/pie'

RSpec.describe SampleCmdletPatterns::Commands::Pie do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Pie.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `pie` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
