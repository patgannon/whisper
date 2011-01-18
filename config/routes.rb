Whisper::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :pages
  resources :sites

  resources :businesses do
    member do
      post :rate
    end
  end

  root :to=> "sites#show", :id0 => "root"
end
