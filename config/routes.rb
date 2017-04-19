Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'signup'                       => 'users#create'
      get  'users/show'                   => 'users#show'
      put 'users/update_avatar'           => 'users#update_avatar'
      put 'users/update'                  => 'users#update_profile'

      resources :address
    end
  end
end
