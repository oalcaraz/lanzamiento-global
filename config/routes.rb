Rails.application.routes.draw do
  
  root to: 'static#home'
  get 'terms_conditions' => 'static#terms_conditions', as: :terms_conditions
  
  devise_for :accounts, :skip => [:registration]
  devise_scope :account do
    get ':username' => 'static#home'
    get ':username/register/:plan' => 'registrations#new', as: :new_account_registration
    #get ':username/register' => 'registrations#new', as: :registration
    post 'register' => 'registrations#create', as: :account_registration
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  authenticate(:account) do
    get 'dashboard' => 'dashboard#index', as: :dashboard
  end
  
end