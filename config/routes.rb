Whisper::Application.routes.draw do
  resources :domain_names

  resources :projects do
    resources :domain_names
    resources :pages
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  
  
  resources :businesses do
    member do
      get :rate
      post :rate
    end
  end
  
  match '/:title1' => 'pages#show', :via => :get
  
  root :to => 'pages#show', :root_path => true
end
