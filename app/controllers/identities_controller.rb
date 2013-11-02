class IdentitiesController < ApplicationController

  def create
     # raise request.env["omniauth.auth"].to_yaml

    auth = request.env["omniauth.auth"]

    @user =  User.from_omniauth(auth)

    if @user.nil?
      @user = identity_save(auth)

      # Log the authorizing user in.
      current_user = @user

        sign_in @user unless signed_in?
        redirect_to root_url if signed_in?
    elsif @user
        current_user = @user
        sign_in @user unless signed_in?
        redirect_to root_url if signed_in?

    end

  end


  private

    def identity_save(auth)
       user = User.create(name:auth.info.name,email:auth.info.email,password:"qwerty",
                          password_confirmation:"qwerty",remote_image_url:auth.info.image.sub("square","large"))
      identities = user.identities.build
      identities.uid = auth.uid
      identities.provider= auth.provider
      if auth.provider.to_s =="facebook"
          cred = auth.credentials.expires_at
          identities.oauth_expires_at =  Time.at(cred)
      end

      identities.oauth_token = auth.credentials.token

      identities.save
      return user
    end

end
