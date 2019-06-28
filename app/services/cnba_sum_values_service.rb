class CnbaSumValuesService
  
  def initialize(financial_movements)
    @financial_movements = financial_movements
  end

  def execute
    cbna_sum_values(@financial_movements)
  end

  private

  def cbna_sum_values(financial_movements)
    sum_values = 0
    financial_movements.each do |item|
      if item.type_transaction.signal.present?
        sum_values += item.value
      else
        sum_values -= item.value
      end
    end
    sum_values
  end
end