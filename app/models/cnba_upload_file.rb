class CnbaUploadFile
  include ActiveModel::Model

  attr_accessor :user, :cnba_file

  validates :user, :cnba_file, presence: true
  validate :cnba_validation

  def cnba_validation
    errors.add(:cnba_file) unless cnba_file.class == ActionDispatch::Http::UploadedFile && cnba_file.content_type == 'text/plain'
  end
end
