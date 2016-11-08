class LinksController < ApplicationController
  before_filter :authorize

  def index
    @links = current_user.links
  end

  def create
    link = Link.new(link_params)
    if link.validate_url(link.url) && link.save
      flash[:notice] = "Link was Added!"
    else
      flash[:alert] = "Link is invalid without proper URL & Title"
    end
    redirect_to root_path
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])
    if link.validate_url(link_params[:url]) && link_params[:title].length > 0
      link.update_attributes(link_params)
      flash[:notice] = "Link was updated!"
    else
      flash[:alert] = "Link is invalid without proper URL & Title"
    end
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :user_id, :read)
  end
end
