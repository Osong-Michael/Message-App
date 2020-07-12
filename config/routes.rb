Rails.application.routes.draw do
  root 'chatroom#index'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  post 'message' => 'messages#create'

  mount ActionCable.server, at: '/cable'
end
