class ReadFanficsController < ApplicationController
  def index
    p params
    case params[:search]
      when 'search_all'
        search_by_tags_any(params[:tags])
      when 'search_any'
        search_by_tags_all(params[:tags])
      when 'search'
        search_by_criteria(params[:criteria])
      else
        @fanfics = Fanfic.all
    end
    @tags = Tag.order(:count).limit(20)
  end

  def show
    @chapters = Chapter.where(fanfic_id: params[:id]).to_a
  end

  private

  def search_by_tags_any(tags)
    if tags.present?
      tags.each do |tag|
        @fanfics = @fanfics.where("tags LIKE :tag", tag: "%#{tag}%")
      end
    end
    @fanfics ||= Fanfic.all
    render partial: 'read_fanfics/fanfics', locals: { fanfics: @fanfics }
  end

  def search_by_tags_all(tags)
    if tags.present?
      @fanfics = []
      tags.each do |tag|
        @fanfics += Fanfic.where("tags LIKE :tag", tag: "%#{tag}%")
      end
      @fanfics.uniq
    end
    @fanfics ||= Fanfic.all
    render partial: 'read_fanfics/fanfics', locals: { fanfics: @fanfics }
  end

  def search_by_criteria(criteria)
    @fanfics = Fanfic.all
    unless criteria.nil?
      @fanfics = []
      @fanfics += Fanfic.where("title LIKE :criteria or description LIKE :criteria or genre LIKE :criteria", criteria: "%#{criteria}%")
      @fanfics += Fanfic.joins(:comments).where("comment LIKE :criteria", criteria: "%#{criteria}%")
      @fanfics += Fanfic.joins(:chapters).where("chapters.title LIKE :criteria or text LIKE :criteria", criteria: "%#{criteria}%")
      @fanfics.uniq
    end
  end
end
