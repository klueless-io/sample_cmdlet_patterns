# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/cursor'

RSpec.describe SampleCmdletPatterns::Commands::Cursor do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Cursor.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `cursor` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
