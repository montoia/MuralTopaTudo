Rails.application.routes.draw do
  devise_for :users
  resources :notices do
    collection do
      get 'homepage' # definindo a rota da homepage
    end
  end
  root 'notices#homepage'
end

