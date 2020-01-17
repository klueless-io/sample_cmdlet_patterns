# frozen_string_literal: true

RSpec.describe '`sample_cmdlet_patterns markdown` command', type: :cli do
  it 'executes `sample_cmdlet_patterns help markdown` command successfully' do
    output = `sample_cmdlet_patterns help markdown`

=begin
Usage:
  sample_cmdlet_patterns markdown SUBCOMMAND

Options:
  -h, [--help], [--no-help]  # Display usage information

Markdown - This is the main entry point to Markdown subcommands
=end

    expect(output).to include('sample_cmdlet_patterns markdown ')
    expect(output).to include('--help')
  end
end
