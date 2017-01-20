Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => "/sidekiq"

  resources :exp_settings
  resources :organizations

  get "/organizations/import_data/:id" => "organizations#import_data"
end
