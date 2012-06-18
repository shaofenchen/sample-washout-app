WashOutSample::Application.routes.draw do
  root :to => 'welcome#index'
  wash_out :rumbas
end