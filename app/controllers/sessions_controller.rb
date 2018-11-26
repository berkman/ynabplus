class SessionsController < ApplicationController
  def create_google
    auth = request.env["omniauth.auth"]
    google_user = User.from_omniauth(auth)
    session[:google_user_id] = google_user.id
    puts google_user.id
    redirect_to root_url, notice: "Successfully logged into the Google account!"
  end
end


    # Find an identity here
    #@identity = Identity.find_with_omniauth(auth)

    #if @identity.nil?
    #  @identity = Identity.create_with_omniauth(auth)

    #end

    #if google_signed_in?
      # SIGN IN A YNAB USER
      #if @identity.user == current_user
      #  redirect_to root_url, notice: "Already linked that account!"
      #else
      #  @identity.user = current_user
      #  @identity.save
      #  redirect_to root_url, notice: "Successfully linked that account!"
      #end
    #else
      #if @identity.user.present?
      #  self.current_user = @identity.user
      #  redirect_to root_url, notice: "Signed in!"
      #else
      #  redirect_to new_user_url, notice: "Please finish registering"
      #end
    #end
  #end

  #def destroy
  #  self.current_user = nil
  #  redirect_to root_url, notice: "Signed out!"
  #end
