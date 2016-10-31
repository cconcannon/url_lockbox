class LinksController < ApplicationController
  before_filter :authorize

  def index
    @links = Link.where(user_id: session[:user_id])
  end
end
