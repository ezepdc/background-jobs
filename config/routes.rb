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
      post 'upload_students'
      post 'upload_courses'
      post 'upload_enrollments'
    end
  end

  get '/export_students_csv', to: 'students#export_students_csv'
end
