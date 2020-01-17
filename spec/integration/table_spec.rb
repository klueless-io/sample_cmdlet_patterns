# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns table` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help table` command successfully' do
    output = `sample_cmdlet_patterns help table`

=begin
Usage:
  sample_cmdlet_patterns table SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Table - This is the main entry point to Table subcommands
=end

    expect(output).to include('sample_cmdlet_patterns table ')
    expect(output).to include('--help')
  end
end
