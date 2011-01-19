Whisper::Application.routes.draw do
  resources :projects

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  

  resources :businesses do
    member do
      post :rate
    end
  end
end
