# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/key_reader'

RSpec.describe SampleCmdletPatterns::Commands::KeyReader do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::KeyReader.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `key_reader` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
