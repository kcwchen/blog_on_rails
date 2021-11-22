Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get('/', {to:"posts#index", as: :root})
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :show, :edit, :update]

  get('/users/:id/edit_password', {to:"users#edit_password", as: :edit_password})
  patch('/users/:id/edit_password', {to:"users#update_password"})

  resource :session, only: [:new, :create, :destroy]
end
