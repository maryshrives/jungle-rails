require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create new product if all four required fields are entered' do
      @category = Category.create!(name: 'Outdoors')
      @product = Product.create!(name: 'Fantastic Paper Shoes', price: 1234, quantity: 15, category: @category)
      expect(@product).to be_valid #Category.new + Product.new also works
    end

    it 'should not be valid without a name' do
      @category = Category.create!(name: 'Outdoors')
      @product = Product.new(name: nil, price: 1234, quantity: 15, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Name can\'t be blank')
    end

    it 'should not be valid without a price' do
      @category = Category.create!(name: 'Outdoors')
      @product = Product.new(name: 'Fantastic Paper Shoes', price: nil, quantity: 15, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Price can\'t be blank')
    end

    it 'should not be valid without a quantity' do
      @category = Category.create!(name: 'Outdoors')
      @product = Product.new(name: 'Fantastic Paper Shoes', price: 1234, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
    end

    it 'should not be valid without a category' do
      @category = Category.create!(name: 'Outdoors')
      @product = Product.new(name: 'Fantastic Paper Shoes', price: 1234, quantity: 15, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Category can\'t be blank')
    end
  end
end