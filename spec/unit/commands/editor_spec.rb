# frozen_string_literal: true

require 'sample_cmdlet_patterns/commands/editor'

RSpec.describe SampleCmdletPatterns::Commands::Editor do
  let(:subcommand) { nil }
  let(:options) { {} }

  subject { SampleCmdletPatterns::Commands::Editor.new(subcommand, options) }

  describe 'initialize' do
    it 'executes `editor` command successfully' do
      output = StringIO.new
      subject.execute(output: output)

      expect(output.string).to eq('')
    end
  end
end
