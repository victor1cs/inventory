class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :celular, -> { where(name: "Celular") }
  scope :tablet, -> { where(name: "Tablet") }
  scope :notebook, -> { where(name: "Notebook") }
  scope :smartwatch, -> { where(name: "Smartwatch") }
  scope :airpods, -> { where(name: "AirPods") }
end
