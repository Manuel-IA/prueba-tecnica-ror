Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  scope module: 'api' do
    namespace :v1 do
      resources :products, only: %i[index show]
    end
  end
end
