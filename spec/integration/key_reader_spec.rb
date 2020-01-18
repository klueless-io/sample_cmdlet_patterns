# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns key_reader` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help key_reader` command successfully' do
    output = `sample_cmdlet_patterns help key_reader`

=begin
Usage:
  sample_cmdlet_patterns key_reader SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Key Reader - Provides features necessary for building line editing and keyboard event processing in terminal applications!
=end

    expect(output).to include('sample_cmdlet_patterns key_reader ')
    expect(output).to include('--help')
  end
end
