# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/link'

RSpec.describe SampleCmdletPatterns::Commands::Link do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Link.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `link` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
