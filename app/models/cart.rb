class Cart < ApplicationRecord

  validates :total, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :products, presence: true
end
