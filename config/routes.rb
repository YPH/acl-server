Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :admin do
        match 'privileges', to: 'privileges#create', via: [:options]
        match 'privileges/:id', to: 'privileges#update', via: [:options]
        resources :privileges
      end

      match 'pages', to: 'pages#create', via: [:options]
      match 'pages/:id', to: 'pages#update', via: [:options]
      resources :pages do
        get 'permit', on: :member
      end

      match 'calendars', to: 'calendars#create', via: [:options]
      match 'calendars/:id', to: 'calendars#update', via: [:options]
      resources :calendars

      match 'users', to: 'users#create', via: [:options]
      match 'users/:id', to: 'users#update', via: [:options]
      resources :users

      match 'sessions', to: 'sessions#create', via: [:options]
      resources :sessions
    end
  end
  #root :to => "home#index"
end
