class LinksController < ApplicationController
  before_filter :authorize

  def index
    @links = current_user.links
  end
end
