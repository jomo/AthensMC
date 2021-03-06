Rails.application.routes.draw do
  devise_for :users
  resources :users, path: 'u', only: [:show], param: :username

  get "links/minecraft" => "links#minecraft"
  post "links" => "links#create"

  resources :whitelist_requests, path: "join"
  resources :revisions
  resources :casts do
#   collection do
#        get 'suggest'
#        post 'suggest'
#    end
  end

  resources :downloads, only: [:index]

  namespace :admin do
    resources :downloads
    resources :users do
      collection do
        get :whitelisted
      end
    end
    resources :whitelist_requests do
      collection do
        get :pending
        get :approved
        get :denied
        patch :approve
        patch :deny
        delete :destroy
      end
    end
  end

  root 'pages#home'

  get "/support", :to => redirect("/subscribe")
  get "information" => 'pages#information'
  get "stats" => "pages#stats"
  get "/change_log", :to => redirect("/revisions")
  get "subscribe" => "pages#subscribe"
  get "servers" => "servers#home"
  get "servers/vanilla" => "servers#vanilla"
  get "servers/rrr" => "servers#rrr"
  get "servers/direwolf20" => "servers#direwolf20"
  get "servers/snapshot" => "servers#snapshot"

end
