class FinancialMovement < ApplicationRecord
  belongs_to :user
  belongs_to :type_transaction
  validates :type_transaction_id, :date_occurrency, :value, :cpf, :card, 
    :time_occurrency :store_owner, :store_name, :user_id, presence: true
  validates_numericality_of :value, greater_than_or_equal_to: 0
end
