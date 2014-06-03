Globaltest::Application.routes.draw do
  resources :missions


  resources :sites


  resources :places


  root :to => 'places#index'
end
