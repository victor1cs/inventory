class Product < ApplicationRecord
  belongs_to :category

  enum :condition, {
    factory_new: 0,
    used: 1
  }

  enum :status, {
    in_stock: 0,
    sold: 1
  }

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :battery_percentage, numericality: { in: 0..100 }, allow_nil: true
  validates :condition, presence: true
  validates :status, presence: true
  validates :category, presence: true
end
