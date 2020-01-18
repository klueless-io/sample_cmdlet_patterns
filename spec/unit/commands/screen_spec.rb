# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/screen'

RSpec.describe SampleCmdletPatterns::Commands::Screen do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Screen.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `screen` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
