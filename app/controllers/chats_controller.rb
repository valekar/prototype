class ChatsController < ApplicationController
  def room
    @user = current_user
    redirect_to signin_path unless current_user
  end


  def new_message
    # Check if the message is private
    if recipient = params[:message].match(/@(.+) (.+)/)

      # It is private, send it to the recipient's private channel
      @channel = "/messages/private/#{recipient.captures.first}"
      @message = { :username => current_user.name, :msg => recipient.captures.second }
    else
      # It's public, so send it to the public channel
      @channel = "/messages/public"
      @message = { :username => current_user.name, :msg => params[:message] }
    end

    respond_to do |f|
      f.js
    end
  end



  private

  def message_params
    params.require(:message).permit(:message)
  end



end
