class EmailAppController < ApplicationController

  #Overview of morse.io app controller
  #For full details, see https://morse.io/developers
  #
  #High level:
  #1) Always validate the signature to confirm the request is valid;
  #2) Use the :install_id param to find the users persisted app;
  #3) Use the :user_email param to identify the user, where required
  #
  #Security tip:
  #  morse.io always appends a unixtime 'timestamp' param to requests.
  #  This timestamp is the time morse.io is sending the request.
  #  It is recommended to ignore requests more than a few minutes old.
  #
  #  As they are always included, you may want to require these params:
  #  - install_id
  #  - user_email
  #  - timestamp
  #  - signature

  before_filter :validate_morse_signature

  def show
    @app = current_user.email_apps.find_or_create_by(
      install_id: params[:install_id]
    )

    #render page - it will display next to email
  end

  def edit
    @app = find_app

    #render edit page to user next to email
  end

  def destroy
    @app = find_app
    @app.destroy
  end

  private
    def current_user
      #return current_user
    end

    def find_app
      return current_user.email_apps.where(
        install_id: params[:install_id]
      ).first
    end

    def validate_morse_signature
      url = request.original_url.split("&signature")[0]
      secret = YOUR_SECRET

      re_signed = Base64.urlsafe_encode64(OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha256'), secret, url
      )).strip()

      if re_signed != params[:signature]
        #Warn yourself - this request may be malicious!
        render nothing: true, status: 401 and return
      else
        #Request is valid
      end
    end
end
