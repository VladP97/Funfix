class ChaptersController < FanficsController
  def new
    @chapter = Chapter.new
  end

  def show
    @chapters = Chapter.where(funfic_id: params[:fanfic_id]).to_a
  end
end