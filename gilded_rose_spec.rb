require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'pry'
describe GildedRose do

  item = [Item.new("foo", 10, 20)]
  cheese = [AgedBrie.new("cheese", 10, 10)]
  the_ring = [LegendaryItem.new("Ring", 0, 80)]
  passes = [BackstagePasses.new("Dr. Bacon", 25, 15)]
  sleeping_child = [ConjuredItem.new("Jules", 20, 20)]
  items = [item,cheese,the_ring,passes,sleeping_child]
  let(:rose) { GildedRose.new(items) }

  describe "#update_inventory" do
    context "when normal item" do
      it "does not change the Item name" do
        foo = rose.items[0]
        rose.update_inventory()
        expect(foo[0].name).to eql("foo")
      end

      it "degrades quality incrementally by 1 as sell_in approaches" do
        foo = rose.items[0]
        expect(foo[0].quality).to eql(19)
        rose.update_inventory
        expect(foo[0].quality).to eql(18)
      end

      it "degrades quality 2x as fast after sell_in has passed" do
        old_item = rose.items[0]
        old_item[0].sell_in = 0
        old_item[0].quality = 20
        rose.update_inventory
        expect(old_item[0].quality).to eql(18)
      end

      it "never has a negative quality" do
        old_item = [Item.new("foo", 0, 0)]
        expired = GildedRose.new(old_item).items[0]
        expired.update_quality
        expired.update_quality
        expect(expired.quality).to be > -1
      end

      it "never increases quality over 50" do
        old_cheese = [AgedBrie.new("Brie", 10, 49)]
        cheese = GildedRose.new(old_cheese).items[0]
        cheese.update_quality
        expect(cheese.quality).to eql(50)
        cheese.update_quality
        expect(cheese.quality).to eql(50)
      end

      it "decrements sell_in by 1" do
        item = rose.items[0]
        item[0].sell_in = 10
        rose.update_inventory
        expect(item[0].sell_in).to eql(9)
      end

    end

    context "when aged brie" do
      it "increases quality of 'aged brie' with time" do
        old_cheese = [AgedBrie.new("Brie", 10, 20)]
        cheese = GildedRose.new(old_cheese).items[0]
        cheese.update_quality
        expect(cheese.quality).to eql(21)
        cheese.update_quality
        expect(cheese.quality).to eql(22)
      end

    end

    context "when legendary item" do
      it "maintains quality of legendary items" do
        ring = rose.items[2]
        rose.update_inventory
        expect(ring[0].quality).to eql(80)
        rose.update_inventory
        expect(ring[0].quality).to eql(80)
      end
    end

    context "when backstage passes" do
      let(:pass) { rose.items[3] }

      it "increments backstage pass quality by 1 when sell_in > 10" do
        pass[0].quality = 15
        rose.update_inventory
        expect(pass[0].quality).to eql(16)
      end

      it "increments backstage pass quality by 2 when sell_in < 10" do
        pass[0].sell_in = 10
        rose.update_inventory
        expect(pass[0].quality).to eql(18)
      end

      it "increments backstage pass quality by 3 when sell_in < 5" do
        pass[0].sell_in = 5
        rose.update_inventory
        expect(pass[0].quality).to eql(21)
      end

    end

    context "when conjured item" do
      let(:sleeping_child) { rose.items[4] }
      it "degrades conjured item quality 2x as fast" do
        sleeping_child[0].quality = 20
        rose.update_inventory
        expect(sleeping_child[0].quality).to eql(18)
      end
    end

  end

end
