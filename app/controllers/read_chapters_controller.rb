class ReadChaptersController < ReadFanficsController
  def show
    @chapter = Chapter.find(params[:id])
  end
end