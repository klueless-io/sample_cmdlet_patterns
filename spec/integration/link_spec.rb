# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns link` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help link` command successfully' do
    output = `sample_cmdlet_patterns help link`

=begin
Usage:
  sample_cmdlet_patterns link SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Link - Allows you to test whether a terminal supports hyperlinks and print them to the console.
=end

    expect(output).to include('sample_cmdlet_patterns link ')
    expect(output).to include('--help')
  end
end
