# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/font'

RSpec.describe SampleCmdletPatterns::Commands::Font do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Font.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `font` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
