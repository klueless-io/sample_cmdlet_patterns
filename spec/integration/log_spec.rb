# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns log` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help log` command successfully' do
    output = `sample_cmdlet_patterns help log`

=begin
Usage:
  sample_cmdlet_patterns log SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Log - This is the main entry point to Log subcommands
=end

    expect(output).to include('sample_cmdlet_patterns log ')
    expect(output).to include('--help')
  end
end
