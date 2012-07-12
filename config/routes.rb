WashOutSample::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :products

  root :to => 'welcome#index'
  wash_out :rumbas
end