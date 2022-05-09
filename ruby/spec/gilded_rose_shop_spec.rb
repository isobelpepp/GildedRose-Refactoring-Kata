require 'gilded_rose_item'
require 'gilded_rose_shop'

describe GildedRose do

  let(:items) { [Item.new('foo', 3, 10)] }
  let(:gilded_rose) { GildedRose.new(items) }

  before do
    gilded_rose.update_quality
  end

  describe 'Regular items' do
    it 'does not change the name' do
      expect(items[0].name).to eq 'foo'
    end
    it 'decreases quality by 1 at the end of the day (before the sell-by date)' do
      expect(items[0].quality).to eq 9
    end
    it 'decreases the sell in by 1 at the end of the day' do
      expect(items[0].sell_in).to eq 2
    end
    it 'decreases the quality by 2 at the end of the day if sell in is less than 0' do
      x = 0
      while x < 4
        gilded_rose.update_quality
        x += 1
      end
      expect(items[0].sell_in).to eq(-2)
      expect(items[0].quality).to eq 4
    end
    it 'never decreases quality to less than 0' do
      x = 0
      while x < 20
        gilded_rose.update_quality
        x += 1
      end
      expect(items[0].quality).to eq 0
    end
  end

  describe 'Aged brie' do
    it 'increases the quality of brie as sell_in decreases' do
      brie = [Item.new('Aged Brie', 5, 10)]
      GildedRose.new(brie).update_quality
      expect(brie[0].quality).to eq 11
      expect(brie[0].sell_in).to eq 4
    end
    it 'cannot be higher than 50 in quality' do
      brie = [Item.new('Aged Brie', 5, 50)]
      GildedRose.new(brie).update_quality
      expect(brie[0].quality).to eq 50
    end
  end

  describe 'Sulfuras' do
    it 'sell_in value and quality never decrease' do
      sulfuras = [Item.new('Sulfuras, Hand of Ragnaros', 7, 30)]
      GildedRose.new(sulfuras).update_quality
      expect(sulfuras[0].quality).to eq 30
      expect(sulfuras[0].sell_in).to eq 7
    end
  end

  describe 'Backstage passes' do
    it 'increases quality by 1 if sell_in is above 20' do
      passes = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 10)]
      GildedRose.new(passes).update_quality
      expect(passes[0].quality).to eq 11
    end
    it 'increases quality by 2 if sell_in is equal to or less than 10' do
      passes = [Item.new('Backstage passes to a TAFKAL80ETC concert', 9, 15)]
      GildedRose.new(passes).update_quality
      GildedRose.new(passes).update_quality
      expect(passes[0].quality).to eq 19
    end
    it 'increases quality by 3 if sell_in is equal to or less than 5' do
      passes = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)]
      GildedRose.new(passes).update_quality
      GildedRose.new(passes).update_quality
      expect(passes[0].quality).to eq 16
    end
    it 'decreases quality to 0 after concert is finished (sell_in is <= 0)' do
      passes = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 50)]
      GildedRose.new(passes).update_quality
      GildedRose.new(passes).update_quality
      expect(passes[0].quality).to eq 0
    end
    it 'never goes above 50' do
      passes = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 50)]
      GildedRose.new(passes).update_quality
      expect(passes[0].quality).to eq 50
    end
  end

  describe 'Conjured' do
    it 'decreases by 2 when sell_in is 0 or above' do
      conjured_items = [Item.new('Conjured', 4, 30)]
      GildedRose.new(conjured_items).update_quality
      expect(conjured_items[0].quality).to eq 28
    end
    it 'decreases by 4 when sell_in is below 0' do
      conjured_items = [Item.new('Conjured', -1, 30)]
      GildedRose.new(conjured_items).update_quality
      expect(conjured_items[0].quality).to eq 26
    end
    it 'does not descreade quality below 0' do
      conjured_items = [Item.new('Conjured', -1, 3)]
      GildedRose.new(conjured_items).update_quality
      expect(conjured_items[0].quality).to eq 0
    end
  end
end
