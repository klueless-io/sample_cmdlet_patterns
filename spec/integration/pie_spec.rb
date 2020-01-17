# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns pie` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help pie` command successfully' do
    output = `sample_cmdlet_patterns help pie`

=begin
Usage:
  sample_cmdlet_patterns pie SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Pie - This is the main entry point to Pie subcommands
=end

    expect(output).to include('sample_cmdlet_patterns pie ')
    expect(output).to include('--help')
  end
end
