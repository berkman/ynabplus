class SessionsController < ApplicationController
  def create
    #user = User.from_omniauth(request.env["omniauth.auth"])
    #session[:user_id] = user.id
    #redirect_to root_path

    auth = request.env["omniauth.auth"]
    # Find an identity here
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      @identity = Identity.create_with_omniauth(auth)
    end

    if signed_in?
      if @identity.user == current_user
        redirect_to root_url, notice: "Already linked that account!"
      else
        @identity.user = current_user
        @identity.save
        redirect_to root_url, notice: "Successfully linked that account!")
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        redirect_to root_url, notice: "Signed in!"
      else
        redirect_to new_user_url, notice: "Please finish registering"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    self.current_user = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def destroy

end
end
