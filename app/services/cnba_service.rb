class CnbaService

  def initialize(user, cnba_file)
    @user = user
    @cnba_file = cnba_file
  end

  def execute
    cnba_file_validate(@cnba_file, @user)
  end

  private

  def cnba_file_validate(cnba_file_line, user)
    ActiveRecord::Base.transaction do
      cnba_file_line.each_line do |cnba_file_line|
        raise StandardError unless cnba_file_line.size == 81
        cnba_save_database(cnba_file_line, user)
      end
    end
  end

  def cnba_save_database(cnba_file_line, user)
    FinancialMovement.create!(
      user_id: user,
      type_transaction_id: cnba_file_line.strip[0].to_i,
      date_occurrency: DateTime.parse(cnba_file_line.strip[1..8] + cnba_file_line.strip[42..47] + "-0300"),
      value: cnba_file_line.strip[9..18].to_i / 100,
      cpf: cnba_file_line.strip[19..29],
      card: cnba_file_line.strip[30..41],
      store_owner: cnba_file_line.strip[48..61],
      store_name: cnba_file_line.strip[62..80]
    )
  end
end