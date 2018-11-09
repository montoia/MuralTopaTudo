Rails.application.routes.draw do
  devise_for :users
  resources :notices do
    collection do
      get 'homepage' # definindo a rota da homepage
      post 'homepage' # para a busca
    end
  end
  root 'notices#homepage'
end

