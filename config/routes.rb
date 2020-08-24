Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'inquiry' => 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'
  get 'search/search'
  get 'search/not_search'
  resources :users, only:[:edit, :update]
  resources :groups, only:[:create, :index, :edit, :update, :destroy] do
  	resources :group_users, only:[:create, :index, :update, :destroy]
    get 'search/search_date'
  	resources :todolists do
  		resources :comments, only:[:create, :destroy]
  		resource :checks, only:[:create, :destroy]
  	end
  end
end
