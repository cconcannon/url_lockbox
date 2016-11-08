class LinksController < ApplicationController
  before_filter :authorize

  def index
    @links = current_user.links
  end

  def create
    link = Link.new(link_params)
    if link.validate_url && link.save
      flash[:notice] = "Link was Added!"
    else
      flash[:alert] = "Link is invalid without proper URL & Title"
    end
    redirect_to root_path
  end

  def update
    link = Link.find(params[:link_id])
    if link.read
      link.update_attribute(:read, false)
    else
      link.update_attribute(:read, true)
    end
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :user_id)
  end
end
