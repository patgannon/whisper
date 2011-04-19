Whisper::Application.routes.draw do
  resources :galleries do
    resources :images
  end

  resources :projects do
    resources :domain_names
    resources :pages do
      collection do
        post :sort
      end
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  
  
  resources :businesses do
    member do
      get :rate
      post :rate
    end
  end
  
  match '/:title1(/:title2)' => 'pages#show', :via => :get
  
  root :to => 'pages#show', :root_path => true
end


