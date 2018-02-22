class FanficsController < PersonsController
  def new
    @genres = Genre.pluck(:name, :name)
    @fanfic = Fanfic.new
  end

  def create
    unless current_user.admin_role
      user_id = current_user.id
    else
      user_id = params[:person_id]
    end
    new_fanfic_params = params[:fanfic]
    new_fanfic_params.merge!(user_id: user_id)
    add_fanfic(new_fanfic_params)
    redirect_to person_path(current_user.id)
  end

  def edit
    @genres = Genre.pluck(:name, :name)
    @fanfic = Fanfic.find(params[:id])
  end

  def update
    if user_check(Fanfic.find(params[:id]))
      Fanfic.update( params[:id],
                     title: params[:fanfic][:title], description: params[:fanfic][:description],
                     image: params[:fanfic][:image])
    end
    redirect_to person_path(current_user.id)
  end

  def destroy
    if user_check(Fanfic.find(params[:id]))
      Fanfics.find(params[:id]).destroy
    end
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

  def user_check(record)
    if record.user_id != current_user.id && !current_user.admin_role
      return false
    end
    true
  end
end