# encoding: UTF-8

class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type

  has_many :line_items, dependent: :destroy

  validates :email, :presence => true, :format => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i


  PAYMENT_TYPES = [ "Przelew", "Płatność gotówką przy odbiorze" ]

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      self.line_items << item
    end
  end
end
