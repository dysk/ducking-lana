require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "vat_price for product with price" do
    p = Product.new
    p.price = 100
    assert_instance_of Float, p.vat_price
    assert_equal 123, p.vat_price
  end

  test "vat_price for product without price" do
    p = Product.new
    assert_instance_of Float, p.vat_price
    assert_equal 0, p.vat_price
  end

  test "product attributes cannot be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
  end
end
