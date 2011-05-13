Whisper::Application.routes.draw do
  resources :inquiries

  resources :products
  resources :articles

  resources :galleries do
    resources :images
  end

  resources :domain_names
  resources :pages do
    collection do
      post :sort
    end
  end

  resources :projects

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  

  resources :users do
    member do
      get :verify
      get :change_password
    end
  end

  
  resources :businesses do
    member do
      get :rate
      post :rate
    end
  end
  
  match '/manage_main_menu' => 'projects#manage_main_menu', :as => :manage_main_menu
  match '/ask_a_question' => 'inquiries#new', :as => :ask_a_question
  match '/courses' => 'products#index', :as => :courses
  match '/:title1(/:title2)' => 'pages#show', :via => :get
  
  root :to => 'pages#show', :root_path => true
end


