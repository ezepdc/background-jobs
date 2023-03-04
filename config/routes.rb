Rails.application.routes.draw do
  get 'students/index'
  get 'students/calculations'
  devise_for :users
  root to: "students#index"

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :students do
    collection do
      post 'upload_csv'
    end
  end
end
