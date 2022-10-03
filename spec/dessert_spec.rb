require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => 'Chef Adam the Great baker') }
  subject(:dessert) { Dessert.new('brownie', 100, chef) }

  describe "#initialize" do

    it "sets a type" do
      expect(dessert.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do

      expect { Dessert.new('brownie', 'kilo', 'Adam')}.to raise_error(ArgumentError)

    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do

      dessert.add_ingredient('meat')
      expect(dessert.ingredients).to include('meat')

    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['pepper', 'garlic', 'meat']

      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end

      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients)
      expect(dessert.ingredients.sort).to eq(ingredients.sort)

    end
  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      expect( dessert.eat(20) ).to eq(80)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect{ dessert.eat(200) }.to raise_error('not enough left!')
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to eq('Chef Adam the Great baker has made 100 brownies!')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
