class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(p_id)

    current_item = self.line_items.where(product_id: p_id).first

    if current_item
      current_item.quantity += 1
    else
      current_item = self.line_items.build(product_id: p_id)
    end

    # return current_item
    current_item
  end
end
