class FanficsController < PersonsController
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
    image_url = generate_image_url(params[:fanfic][:image])
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

  def generate_image_url(image_name)
    if image_name.match(/http:\/\/res.cloudinary.com\/dhpelms3i\/image\/upload\/v1517841525\//)
      image_name
    else
      'http://res.cloudinary.com/dhpelms3i/image/upload/v1517841525/' + image_name
    end
  end

  def add_tags(tags)
    tags_array = tags.split
    tags_array.each {|tag|
      if !Tag.where(tag: tag).any?
        Tag.create(tag: tag)
      end }
  end

  def add_fanfic(new_fanfic_params)
    Fanfic.create(
        title: new_fanfic_params[:title], description: new_fanfic_params[:description],
        image: 'http://res.cloudinary.com/dhpelms3i/image/upload/v1517841525/' + new_fanfic_params[:image],
        genre: new_fanfic_params[:genre],
        user_id: new_fanfic_params[:user_id],
        tags: new_fanfic_params[:tags]).save
  end
end