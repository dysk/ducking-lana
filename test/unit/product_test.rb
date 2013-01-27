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

  test "invalid image url validation" do
    p = Product.new
    p.image_url = 'fsdf'
    assert p.invalid?
    assert_equal 'must be a URL for GIF, JPG or PNG image.',  p.errors[:image_url][0]
  end

  test "valid image url validation" do
    good = ['aaa.jpg', 'bbb.png', 'ccc.gif', 'aaa.JPG', 'bbb.PNG', 'ccc.GIF']
    bad  = ['dfsdf', 'product.rb', 'winword.exe']

    good.each do |image|
      assert new_product(image).valid?, "Image extension #{image.last(3)} not supported"
    end

    bad.each do |image|
      assert new_product(image).invalid?, "Strange extension passed through validation"
    end
  end

  def new_product(image_url)
    return Product.new(title: 'Jakis tytul', description: "Jakis opis", price: 100, image_url: image_url)
  end
end
