require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
   it 'validates all presence ' do
    @category = Category.new
    @product = Product.new(name:"name", price: 3.99, quantity: 5, category: @category)
    @product.save!
    expect(@product.id).to be_present
   end
   it 'validates name presence ' do
   @category = Category.new
      @product = Product.new(name: nil, price: 3.99, quantity: 5, category: @category)
      @product.validate
      expect(@product.errors.full_messages).to include("Name can't be blank") 
    end
    it "will not validate if price is not present" do
      @category = Category.new
      @product = Product.new(name: "name", price: [nil], quantity: 12, category: @category)
      @product.validate
      expect(@product.errors.full_messages).to include("Price can't be blank") 
    end
   
   it 'validates quantity presence ' do
    @category = Category.new
    @product = Product.new(name:"name", price: 3.99, quantity: nil, category: @category)
    @product.validate
    expect(@product.errors.full_messages).to include("Quantity can't be blank") 
   end
   it 'validates category presence ' do
    @category = Category.new
    @product = Product.new(name:"name", price: 3.99, quantity: 5, category: nil)
    @product.validate
    expect(@product.errors.full_messages).to include("Category can't be blank") 
   end
  end
end


# describe '#id' do
#   it 'should not exist for new records' do
#     @widget = Widget.new
#     expect(@widget.id).to be_nil
#   end

#   it 'should be auto-assigned by AR for saved records' do
#     @widget = Widget.new
#     # we use bang here b/c we want our spec to fail if save fails (due to validations)
#     # we are not testing for successful save so we have to assume it will be successful
#     @widget.save!

#     expect(@widget.id).to be_present
#   end
# end