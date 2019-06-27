class TypeTransaction < ApplicationRecord
  validates :type, :description, :nature, :signal, presence: true
  enum nature: { output: "saida", input: "entrada" }
  enum signal: { negative: "-", positive: "+" }
end
