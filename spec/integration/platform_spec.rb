# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns platform` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help platform` command successfully' do
    output = `sample_cmdlet_patterns help platform`

=begin
Usage:
  sample_cmdlet_patterns platform SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Platform - Find out the properties of your operating system
=end

    expect(output).to include('sample_cmdlet_patterns platform ')
    expect(output).to include('--help')
  end
end
