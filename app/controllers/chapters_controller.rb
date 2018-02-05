class ChaptersController < FanficsController
  def new
    @chapter = Chapter.new
  end

  def index
    @chapters = Chapter.where(fanfic_id: params[:fanfic_id]).to_a
  end

  def create
    new_chapter_params = params[:chapter]
    new_chapter_params.merge!({ user_id: params[:person_id].to_s, fanfic_id: params[:fanfic_id] })
    Chapter.create(
        title: new_chapter_params[:title], text: new_chapter_params[:text],
        image: 'http://res.cloudinary.com/dhpelms3i/image/upload/v1517841525/' + new_chapter_params[:image],
        fanfic_id: new_chapter_params[:fanfic_id]).save
    redirect_to person_path(current_user.id)
  end
end