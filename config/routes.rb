Rails.application.routes.draw do
  
  root to: 'static#home'
  get 'r/:username' => 'static#home'
  
  
  devise_for :accounts, :skip => [:registration]
  as :account do
    
    get 'register/:plan/:username' => 'registrations#new', as: :new_account_registration
    #get ':username/register' => 'registrations#new', as: :registration
    post 'register' => 'registrations#create', as: :account_registration
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  authenticate(:account) do
    #get 'dashboard' => 'dashboard#index', as: :dashboard
  end
  
  # Static pages
  get 'terms_conditions' => 'static#terms_conditions', as: :terms_conditions
  
end