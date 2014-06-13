Rails.application.routes.draw do
  
  root to: 'static#home'
  get 'r/:username' => 'static#home', as: :user_landing
  
  
  devise_for :accounts, :skip => [:registration]
  as :account do
    
    get 'register/:plan/:username' => 'registrations#new', as: :new_account_registration
    #get ':username/register' => 'registrations#new', as: :registration
    post 'register' => 'registrations#create', as: :account_registration
    get 'accounts/edit' => 'registrations#edit', as: :edit_account_registration
    patch 'accounts' => 'accounts/registrations#update', as: :edit_account_registration_patch
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  authenticate(:account) do
    get 'dashboard' => 'dashboard#index', as: :dashboard
    get 'accounts/credit_card' => 'account#credit_card', as: :account_credit_card
    post 'accounts/credit_card' => 'account#process_credit_card', as: :process_credit_card
  end
  
  # Static pages
  get 'terms_conditions' => 'static#terms_conditions', as: :terms_conditions
  
end