# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns screen` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help screen` command successfully' do
    output = `sample_cmdlet_patterns help screen`

=begin
Usage:
  sample_cmdlet_patterns screen SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Screen - Terminal screen size detection which works on Linux, OS X and Windows/Cygwin platforms and supports MRI, JRuby and Rubinius interpreters.
=end

    expect(output).to include('sample_cmdlet_patterns screen ')
    expect(output).to include('--help')
  end
end
