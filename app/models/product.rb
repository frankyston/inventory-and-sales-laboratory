class Product < ApplicationRecord
  has_many :entries
  has_many :sale_items

  validates :name, :price, presence: true
  validates :price, :numericality => { :greater_than => 0 }
end
