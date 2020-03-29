Rails.application.routes.draw do
  get 'users/new'
  get 'users/index'
  post 'users/create'
  get 'users/filter_table'

  get 'roles/new'
  post 'roles/create'
  get 'roles/hide_roles_form'
  patch 'roles/update_roles'
  # resources :roles, only:[:new, :create] do
  #   collection do
  #     get 'hide_roles_form'
  #     patch 'update_roles'
  #   end
  # end
  root "roles#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
