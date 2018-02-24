class TagsController < ApplicationController
  def index
    render json: { tags: Tag.pluck(:tag, :tag) }
  end

  def get_all
    render partial: "read_fanfics/tags", locals: { tags: Tag.order(count: :desc), is_hidden: false }
  end

  def hide_all
    render partial: "read_fanfics/tags", locals: { tags: Tag.order(count: :desc).limit(10), is_hidden: true }
  end
end