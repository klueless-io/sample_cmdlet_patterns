# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns cursor` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help cursor` command successfully' do
    output = `sample_cmdlet_patterns help cursor`

=begin
Usage:
  sample_cmdlet_patterns cursor SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Cursor - Terminal cursor movement and manipulation of cursor properties such as visibility
=end

    expect(output).to include('sample_cmdlet_patterns cursor ')
    expect(output).to include('--help')
  end
end
