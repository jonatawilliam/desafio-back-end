class CnabJob < ApplicationJob # >
  queue_as :default

  def perform(user, cnba_file_string)
    CnbaService.new(user, cnba_file_string).execute
  end
end
