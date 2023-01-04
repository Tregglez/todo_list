Rails.application.routes.draw do
  root 'todos#index'
  resources :todos, except: %i[index]
end
