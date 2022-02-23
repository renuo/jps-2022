require_relative '../lib/google_importing'

RSpec.describe GoogleImporting do
  it 'works for a simple file' do
    world = GoogleImporting.build_world('a')
    expect(world.numbers).to contain_exactly(1, 2, 3, 4, 5, 6, 7, 8, 9)
  end
end
