Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'group_users/member'
  get 'search/search'
  get 'search/not_search'
  resources :users, only:[:edit, :update]
  resources :groups, only:[:create, :index, :edit, :update, :destroy] do
  	resources :group_users, only:[:create, :index, :update, :destroy]
  	resources :todolists do
  		resources :comments, only:[:create, :destroy]
  		resource :checks, only:[:create, :destroy]
  	end
  end
end
