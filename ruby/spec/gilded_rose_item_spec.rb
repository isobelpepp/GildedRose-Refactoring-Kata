require 'gilded_rose_item'

describe Item do
  let(:item) { Item.new('item', 30, 5)}

  it 'should know its own name' do
    expect(item.name).to eq 'item'
  end

  it 'should know its own sell_in' do
    expect(item.sell_in).to eq 30
  end

  it 'should know its quality' do
    expect(item.quality).to eq 5
  end
end
