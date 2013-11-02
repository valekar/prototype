class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

 # respond_to :json

  def index
  end

  def create
=begin
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
=end

    #respond_with current_user.microposts.create(params[:micropost_params])

    respond_to do |f|
      f.json { current_user.microposts.create(params[:micropost_params]) }
    end

  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end


  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
