# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns pager` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help pager` command successfully' do
    output = `sample_cmdlet_patterns help pager`

=begin
Usage:
  sample_cmdlet_patterns pager SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Pager - This is the main entry point to Pager subcommands
=end

    expect(output).to include('sample_cmdlet_patterns pager ')
    expect(output).to include('--help')
  end
end
