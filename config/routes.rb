Rails.application.routes.draw do
  get 'users/new'
  get 'users/name'
  get 'users/email'
  get 'welcome/index'
  root 'static_pages#home'
  get 'static_pages/home'
  get '/help',    to:'static_pages#help'
  get '/about',   to:'static_pages#about'
  get 'contact',  to:'static_pages#contact'
  resources :articles
  resources :notebooks
  resources :sections
  resources :tabs
  resources :pages
  resources :paragraphs
  # get  'users#new'
end
