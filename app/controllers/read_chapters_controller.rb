class ReadChaptersController < ReadFanficsController
  def show
    @chapter = Chapter.find(params[:id])
    @fanfic = Fanfic.find(params[:read_fanfic_id])
    @chapters = @fanfic.chapters
    show_average_rating(Rating.where(chapter_id: params[:id]))
    show_user_rating(Rating.where(user_id: current_user.id, chapter_id: params[:id]))
    @comment = Comment.new
  end

  private

  def show_user_rating(rating)
    if rating.any?
      @user_rating = rating[0][:rating]
    else
      @user_rating = "You haven't rate this post yet"
    end
  end

  def show_average_rating(ratings)
    if ratings.any?
      @rating = ratings.average(:rating)
    else
      @rating = "No one rate this post yet"
    end
  end
end