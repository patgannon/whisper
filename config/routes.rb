Whisper::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :pages
  resources :sites
  root :to=> "sites#show", :id0 => "root"
end
