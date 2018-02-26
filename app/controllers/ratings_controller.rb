class RatingsController < ApplicationController
  def create
    existing_rating = Rating.where(user_id: current_user.id, chapter_id: params[:chapter])
    if existing_rating.any?
      existing_rating.update(rating: params[:rating].to_i)
    else
      Rating.create(user_id: current_user.id,
                    chapter_id: params[:chapter],
                    rating: params[:rating].to_i)
    end
    show_average_rating(Rating.where(chapter_id: params[:chapter]))
    render partial: 'read_chapters/rating', locals: { rating: @rating,
                                                      user_rating: params[:rating],
                                                      chapter: params[:chapter]}
  end

  private

  def show_average_rating(ratings)
    if ratings.any?
      @rating = ratings.average(:rating)
    else
      @rating = "No one rate this post yet"
    end
  end
end