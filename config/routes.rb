Whisper::Application.routes.draw do
  resources :pages

  resources :projects

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  
  
  resources :users do
    member do
      get :me
    end
  end

  resources :businesses do
    member do
      post :rate
    end
  end
  
  root :to => "users#me"
end
