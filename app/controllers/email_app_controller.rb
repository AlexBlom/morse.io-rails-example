class EmailAppController < ApplicationController
  # Overview of morse.io app controller
  # For full details, see https://morse.io/developers
  # 
  # High level:
  # 1) Always validate the signature to confirm the request is valid;
  # 2) Use the :install_id param to find the users persisted app;
  # 3) Use the :user_email param to identify the user, where required
  # 
  # Security tip:
  #   morse.io always appends a unixtime 'timestamp' param to requests.
  #   This timestamp is the time morse.io is sending the request.
  #   It is recommended to ignore requests more than a few minutes old.
  # 
  #   As they are always included, you may want to require these params:
  #   - install_id
  #   - user_email
  #   - timestamp
  #   - signature

  before_filter :validate_morse_signature
  skip_before_filter :verify_authenticity_token

  def show
    #Locate a single install via install_id param
    #@app = current_user.email_apps.find_or_create_by(
    #  install_id: params[:install_id]
    #)

    #Access Contact data /w params[:contact_name] && params[:contact_email]
    render text: "I am the showing next to email"
  end

  def edit
    render text: "I am editable next to email"
  end

  def destroy
    #Find by install id and destroy
  end

  private
    def validate_morse_signature
      #Validate signature against url stripped of signature
      #morse.io forces https urls
      url = request.original_url.gsub('http', 'https').split("&signature")[0]
      secret = "MYSECRET"

      url = url.gsub("https://staging.morse.io//", "https://staging.morse.io/sample/")

      re_signed = Base64.urlsafe_encode64(OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha256'), secret, url
      )).strip()

      if re_signed != params[:signature]
        #Warn yourself - this request may be malicious!
        Rails.logger.warn("Signature not valid")
        render nothing: true, status: 401 and return
      else
        #Request is valid
      end
    end
end
