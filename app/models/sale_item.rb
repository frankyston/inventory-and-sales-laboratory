class SaleItem < ApplicationRecord
  belongs_to :product
  belongs_to :sale

  validates :quantity, presence: true
  validates :quantity, :numericality => { :greater_than => 0 }

  validate :check_quantity

  def check_quantity
    if self.quantity > self.product.quantity
      errors[:quantity] << "Quantidade de item insuficiente. Atualmente só tem #{self.product.quantity} items."
      throw :abort
    end
  end
end
