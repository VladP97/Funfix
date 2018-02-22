class FanficsController < PersonsController

  before_action :check_user

  def new
    @genres = Genre.pluck(:name, :name)
    @fanfic = Fanfic.new
  end

  def create
    new_fanfic_params = params[:fanfic]
    new_fanfic_params.merge!(user_id: params[:person_id].to_s)
    add_tags(params[:fanfic][:tags])
    add_fanfic(new_fanfic_params)
    redirect_to person_path(current_user.id)
  end

  def edit
    @genres = Genre.pluck(:name, :name)
    @fanfic = Fanfic.find(params[:id])
  end

  def update
    Fanfic.update( params[:id],
                   title: params[:fanfic][:title], description: params[:fanfic][:description],
                   image: image_url)
    redirect_to person_path(current_user.id)
  end

  def destroy
    Fanfics.find(params[:id]).destroy
    redirect_to person_path(current_user.id)
  end
  
  private

  def add_tags(tags)
    tags_array = tags.split
    tags_array.each {|tag|
      active_record_tag = Tag.where(tag: tag)
      if active_record_tag.any?
        Tag.update(active_record_tag[0][:id], count: active_record_tag[0][:count] + 1)
      else
        Tag.create(tag: tag)
      end }
  end

  def add_fanfic(new_fanfic_params)
    add_tags(params[:fanfic][:tags])
    Fanfic.create(
        title: new_fanfic_params[:title], description: new_fanfic_params[:description],
        image: new_fanfic_params[:image],
        genre: new_fanfic_params[:genre],
        user_id: new_fanfic_params[:user_id],
        tags: new_fanfic_params[:tags]).save
  end

  def check_user
    if params[:person_id] != current_user.id && !current_user.admin_role
      redirect_to root_path
    end
  end
end