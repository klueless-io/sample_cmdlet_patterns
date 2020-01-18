# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns which` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help which` command successfully' do
    output = `sample_cmdlet_patterns help which`

=begin
Usage:
  sample_cmdlet_patterns which SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Which - Platform independent implementation of Unix which utility that searches for executable file in the path variable.
=end

    expect(output).to include('sample_cmdlet_patterns which ')
    expect(output).to include('--help')
  end
end
