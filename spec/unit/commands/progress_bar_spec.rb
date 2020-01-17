# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/progress_bar'

RSpec.describe SampleCmdletPatterns::Commands::ProgressBar do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::ProgressBar.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `progress_bar` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
