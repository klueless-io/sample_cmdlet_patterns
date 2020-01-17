# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/table'

RSpec.describe SampleCmdletPatterns::Commands::Table do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Table.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `table` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
