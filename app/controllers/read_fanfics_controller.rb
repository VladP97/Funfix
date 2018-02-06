class ReadFanficsController < ApplicationController
  def index
    @fanfics = Fanfic.all
  end

  def show
    @chapters = Chapter.where(fanfic_id: params[:id]).to_a
  end
end
