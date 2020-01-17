# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns progress_bar` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help progress_bar` command successfully' do
    output = `sample_cmdlet_patterns help progress_bar`

=begin
Usage:
  sample_cmdlet_patterns progress_bar SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Progress Bar - This is the main entry point to Progress Bar subcommands
=end

    expect(output).to include('sample_cmdlet_patterns progress_bar ')
    expect(output).to include('--help')
  end
end
