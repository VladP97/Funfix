class ReadChaptersController < ReadFanficsController
  def show
    @chapter = Chapter.find(params[:id])
    @fanfic = Fanfic.find(params[:read_fanfic_id])
    @comment = Comment.new
  end
end