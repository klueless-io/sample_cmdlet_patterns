# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/a'

RSpec.describe SampleCmdletPatterns::Commands::A do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::A.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `a` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
