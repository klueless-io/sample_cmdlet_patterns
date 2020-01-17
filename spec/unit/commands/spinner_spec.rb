# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/spinner'

RSpec.describe SampleCmdletPatterns::Commands::Spinner do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Spinner.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `spinner` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
