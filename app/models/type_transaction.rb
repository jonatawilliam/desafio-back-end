class TypeTransaction < ApplicationRecord
  has_many :financial_movements
  validates :description, :nature, presence: true
end
