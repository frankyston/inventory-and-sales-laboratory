class Sale < ApplicationRecord
  enum status: [ :sale, :adjustment ]
  belongs_to :customer
  has_many :sale_items, dependent: :destroy

  accepts_nested_attributes_for :sale_items, reject_if: :all_blank, allow_destroy: true

  before_save :set_value_total

  def set_value_total
    self.value_total = 0
    self.value_total = self.sale_items.map{|si| si.quantity*si.product.price}.sum

      self.sale_items.each do |sale_item|
        if self.sale?
          sale_item.product.quantity = sale_item.product.quantity - sale_item.quantity
        else
          old_quantity_item = SaleItem.find(sale_item.id).quantity
          new_quantity_item = sale_item.quantity
          product_quantity = Product.find(sale_item.product.id).quantity

          final_quantity = product_quantity + (old_quantity_item - new_quantity_item)

          sale_item.product.quantity = final_quantity
        end
        sale_item.value_unit = sale_item.product.price
        sale_item.value_total = sale_item.product.price * sale_item.quantity
        sale_item.product.save
      end
  end


end
