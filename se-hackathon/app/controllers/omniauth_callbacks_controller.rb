class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    hacker = Hacker.find_or_create_for_github_oauth(request.env["omniauth.auth"], current_hacker)

    if hacker.persisted?
      sign_in_and_redirect hacker, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_hacker_registration_url
    end
  end

end
