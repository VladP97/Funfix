class TagsController < ApplicationController
  def index
    render json: { tags: Tag.pluck(:tag, :tag) }
  end
end