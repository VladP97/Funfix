class ChaptersController < FanficsController

  before_action :check_user

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
        image: new_chapter_params[:image],
        fanfic_id: new_chapter_params[:fanfic_id]).save
    redirect_to person_path(current_user.id)
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    Chapter.update( params[:id],
        title: params[:chapter][:title], text: params[:chapter][:text],
        image: params[:chapter][:image]).save
    redirect_to person_path(current_user.id)
  end

  private

  def check_user
    if Fanfic.find(params[:fanfic_id]).user_id != current_user.id && !current_user.admin_role
      redirect_to root_path
    end
  end
end