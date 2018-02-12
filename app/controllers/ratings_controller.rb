class RatingsController < ApplicationController
  def new
    if !Rating.where(user_id: current_user.id, chapter_id: params[:read_chapter_id])
      Rating.create(user_id: current_user.id,
                    chapter_id: params[:read_chapter_id],
                    rating: params[:rating])
    else
      Rating.update(user_id: current_user.id,
                    chapter_id: params[:read_chapter_id],
                    rating: params[:rating])
    end
    redirect_to read_fanfic_read_chapter_path(params[:read_fanfic_id], params[:read_chapter_id])
  end
end