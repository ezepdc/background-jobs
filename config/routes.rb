Rails.application.routes.draw do
  get 'students/index'
  devise_for :users
  root to: "pages#home"

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
