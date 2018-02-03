class FanficsController < PersonsController
  def new
    @genres = Genre.pluck(:name, :name)
    @fanfic = Fanfic.new
  end

  def create
    new_fanfic_params = params[:fanfic]
    new_fanfic_params.merge!(user_id: params[:person_id].to_s)
    Fanfic.create(
        title: new_fanfic_params[:title], description: new_fanfic_params[:description],
        image: new_fanfic_params[:image], genre: new_fanfic_params[:genre],
        user_id: new_fanfic_params[:user_id]).save
    redirect_to person_path(current_user.id)
  end
end