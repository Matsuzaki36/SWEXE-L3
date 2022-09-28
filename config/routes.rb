Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :tweets
    root 'tweets#index'
    get 'get_image/:id', to: 'tweets#get_image'
end
