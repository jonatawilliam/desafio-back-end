class CnbaUploadFilesController < ApplicationController

  def new
    @cnba_file = CnbaUploadFile.new
  end

  def create
    cnba_file = CnbaUploadFile.new(cnba_file_params)
    if cnba_file.valid?
      cnba_file_string = File.read(cnba_file_params[:cnba_file].path)
      CnbaService.new(cnba_file_params[:user][:id], cnba_file_string).execute
      redirect_to root_path, notice: "Movimentação Financeira inserida na base de dados! "
    else
      redirect_to new_cnba_upload_file_path, notice: "Extensão inválida para upload CNBA "
    end
  end

  private

  def cnba_file_params
    params.require(:cnba_upload_file).permit(:cnba_file).merge(user: current_user)
  end
end