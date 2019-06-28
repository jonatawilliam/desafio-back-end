class TypeTransactionsController < ApplicationController
  def index
    financial_movements = current_user.financial_movements.includes(:type_transaction)
    @financial_movements = financial_movements.paginate(page: params[:page])
    sum_value = CnbaSumValuesService.new(financial_movements).execute
    sum_value.present? ? @sum_value = sum_value : @sum_value = 'Não há valores a serem calculados'
  end
end