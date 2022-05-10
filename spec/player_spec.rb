require_relative '../app/models/player'

describe 'Player' do
  it 'hello' do
    p = Player.new
    expect(p.hello).to eq("hello")
  end
end