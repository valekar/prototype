class StaticPagesController < ApplicationController
  def home

    if signed_in?
      #used to create new micropost
      @micropost  = current_user.microposts.build
      #this collects all the microposts
      @feed_items = current_user.feed.paginate(page: params[:page])
      @user = current_user
      @comment = Comment.new

    else
      @user = User.new
    end
  end

  def help
  end

  def about
  end

  def contact

  end
end
