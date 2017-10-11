class Entry < ApplicationRecord
  enum status: [ :entry, :adjustment ]
  belongs_to :product

  validates :quantity, :value_unit, presence: true
  validates :quantity, :value_unit, :numericality => { :greater_than => 0 }

  before_save :set_value_total

  def set_value_total
    self.value_total = self.quantity * self.value_unit
    if self.entry?
      self.product.quantity = self.product.quantity + self.quantity
    else
      self.product.quantity = self.product.quantity - (self.product.quantity - self.quantity)
    end
    self.product.save
  end
end
