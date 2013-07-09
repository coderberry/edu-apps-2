EduApps::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :api_keys, except: [:new, :edit]
      resources :users, except: [:new, :edit]
      post 'session' => 'session#create'
    end
  end
end