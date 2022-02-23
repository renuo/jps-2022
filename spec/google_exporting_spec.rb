require 'tempfile'
require_relative '../lib/google_exporting'

RSpec.describe GoogleExporting do
  let(:tempfile) { Tempfile.new }

  around do |example|
    example.run
  ensure
    tempfile.close
    tempfile.unlink
  end

  it 'works for a simple file' do
    result = double(sum: 45)
    described_class.write_result(result, tempfile.path)
    tempfile.rewind
    expect(tempfile.read).to eq("45\n")
  end
end
