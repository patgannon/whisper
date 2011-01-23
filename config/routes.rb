Whisper::Application.routes.draw do
  resources :projects do
    resources :pages
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  
  
  resources :businesses do
    member do
      get :rate
      post :rate
    end
  end
  
  root :to => "projects#index"
end
