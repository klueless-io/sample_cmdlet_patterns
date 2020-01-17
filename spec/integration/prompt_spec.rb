# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns prompt` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help prompt` command successfully' do
    output = `sample_cmdlet_patterns help prompt`

=begin
Usage:
  sample_cmdlet_patterns prompt SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Prompt - This is the main entry point to Prompt subcommands
=end

    expect(output).to include('sample_cmdlet_patterns prompt ')
    expect(output).to include('--help')
  end
end
