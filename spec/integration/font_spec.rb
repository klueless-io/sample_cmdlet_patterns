# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns font` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help font` command successfully' do
    output = `sample_cmdlet_patterns help font`

=begin
Usage:
  sample_cmdlet_patterns font SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Font - This is the main entry point to Font subcommands
=end

    expect(output).to include('sample_cmdlet_patterns font ')
    expect(output).to include('--help')
  end
end
