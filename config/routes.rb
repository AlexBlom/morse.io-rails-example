Rails.application.routes.draw do

  #A morse.io app listens relies on the following events
  # (see https://morse.io/developers/docs/events)
  #
  #Base path:
  # APP_URL/:user_email/:install_id
  # where APP_URL is the url set in your morse.io developer portal
  #
  #Events:
  # POST /show: App is being viewed next to email. See docs for additional contact params
  # GET /edit:  User is trying to edit apps settings
  # DELETE:     User has uninstalled your app

  resources :email_app, path: ':user_email', 
    param: :install_id,
    only: [:edit, :destroy], 
    constraints: { user_email: /[^\/]+/ } do
      post 'show', to: "email_app#show"
  end
end
