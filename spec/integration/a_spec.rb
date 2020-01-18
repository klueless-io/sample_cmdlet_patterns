# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns a` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help a` command successfully' do
    output = `sample_cmdlet_patterns help a`

=begin
Usage:
  sample_cmdlet_patterns a SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

A - This is the main entry point to A subcommands
=end

    expect(output).to include('sample_cmdlet_patterns a ')
    expect(output).to include('--help')
  end
end
