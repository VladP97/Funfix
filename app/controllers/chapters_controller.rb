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

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    image_url = generate_image_url(params[:chapter][:image])
    Chapter.update( params[:id],
        title: params[:chapter][:title], text: params[:chapter][:text],
        image: image_url).save
    redirect_to person_path(current_user.id)
  end

  private

  def generate_image_url(image_name)
    if image_name.match(/http:\/\/res.cloudinary.com\/dhpelms3i\/image\/upload\/v1517841525\//)
      image_name
    else
      'http://res.cloudinary.com/dhpelms3i/image/upload/v1517841525/' + image_name
    end
  end
end