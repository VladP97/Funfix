class ReadFanficsController < ApplicationController
  def index
    if params[:search] == 'search_all'
      search_by_tags_any(params[:tags])
    elsif params[:search] == 'search_any'
      search_by_tags_all(params[:tags])
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
    @fanfics = Fanfic.all
    unless tags.nil?
      tags.each do |tag|
        @fanfics = @fanfics.where("tags LIKE :tag", tag: "%#{tag}%")
      end
    end
    render partial: 'read_fanfics/fanfics', locals: { fanfics: @fanfics }
  end

  def search_by_tags_all(tags)
    @fanfics = []
    unless tags.nil?
      tags.each do |tag|
        @fanfics += Fanfic.where("tags LIKE :tag", tag: "%#{tag}%")
      end
      p @fanfics
      @fanfics.uniq
    end
    render partial: 'read_fanfics/fanfics', locals: { fanfics: @fanfics }
  end
end
