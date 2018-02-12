class ReadChaptersController < ReadFanficsController
  def show
    @chapter = Chapter.find(params[:id])
    @fanfic = Fanfic.find(params[:read_fanfic_id])
    @rating = Rating.average(:rating)
    @user_rating = Rating.where(user_id: current_user.id)[0][:rating]
    @comment = Comment.new
  end
end