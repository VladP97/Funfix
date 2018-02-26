class ReadFanficsController < ApplicationController
  def index
    case params[:search]
      when 'search_any'
        search_by_tags_any(params[:tags])
      when 'search_all'
        search_by_tags_all(params[:tags])
      when 'search'
        search_by_criteria(params[:criteria])
      else
        @fanfics = Fanfic.order(created_at: :desc).page(params[:page])
    end
    @tags = Tag.order(count: :desc).limit(10)
  end

  def show
    @chapters = Chapter.where(fanfic_id: params[:id])
  end

  private

  def search_by_tags_all(tags)
    unless tags.nil?
      @fanfics = Fanfic.all
      tags.each do |tag|
        @fanfics = @fanfics.where("tags LIKE :tag", tag: "%#{tag}%").order(created_at: :desc).page(params[:page])
      end
    else
      @fanfics = Fanfic.order(created_at: :desc).page(params[:page])
    end
  end

  def search_by_tags_any(tags)
    @fanfics = []
    unless tags.nil?
      @fanfics = Fanfic.where(generate_query(tags)).order(created_at: :desc).page(params[:page])
    else
      @fanfics = Fanfic.order(created_at: :desc).page(params[:page])
    end
  end

  def search_by_criteria(criteria)
    unless criteria.nil?
      @fanfics = Fanfic.order(created_at: :desc).includes(:comments, :chapters).where("fanfics.title LIKE :criteria or description LIKE :criteria or genre LIKE :criteria or comment LIKE :criteria or chapters.title LIKE :criteria or text LIKE :criteria", criteria: "%#{criteria}%").references(:comments, :chapters).page(params[:page])
    else
      @fanfics = Fanfic.order(created_at: :desc).page(params[:page])
    end
  end

  def generate_query(tags)
    query = "tags LIKE '%#{tags[0]}%'"
    tags.drop(1).each_index do |index|
      query += " OR tags LIKE '%#{tags[index + 1]}%'"
    end
    query
  end
end
