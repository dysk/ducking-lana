class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  validates :title, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0.0, less_than: 1000000 }
  validates :description, presence: true
  validates :image_url, allow_blank: true,
      format: {
        with:    %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
      }


  def vat_price
    if self.price.nil?
      return 0.0
    else
      return self.price*1.23
    end
  end
end