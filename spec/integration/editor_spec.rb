# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns editor` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help editor` command successfully' do
    output = `sample_cmdlet_patterns help editor`

=begin
Usage:
  sample_cmdlet_patterns editor SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Editor - This is the main entry point to Editor subcommands
=end

    expect(output).to include('sample_cmdlet_patterns editor ')
    expect(output).to include('--help')
  end
end
