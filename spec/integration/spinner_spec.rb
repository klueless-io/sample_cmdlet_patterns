# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns spinner` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help spinner` command successfully' do
    output = `sample_cmdlet_patterns help spinner`

=begin
Usage:
  sample_cmdlet_patterns spinner SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Spinner - This is the main entry point to Spinner subcommands
=end

    expect(output).to include('sample_cmdlet_patterns spinner ')
    expect(output).to include('--help')
  end
end
