class ReadChaptersController < ReadFanficsController
  def show
    @chapter = Chapter.find(params[:id])
    @fanfic = Fanfic.find(params[:read_fanfic_id])
    @rating = Rating.average(:rating)
    if Rating.where(user_id: current_user.id, chapter_id: params[:id]).to_a != []
      @user_rating = Rating.where(user_id: current_user.id)[0][:rating]
    else
      @user_rating = "You don't rate this post yet"
    end
    @comment = Comment.new
  end
end