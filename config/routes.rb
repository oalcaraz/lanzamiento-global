Rails.application.routes.draw do
  
  get '/dashboard' => 'dashboard#index', as: :dashboard
  get '/' => 'static#home'
  get '/terms_conditions' => 'static#terms_conditions', as: :terms_conditions

  devise_scope :account do
    get '/:username' => 'static#home', as: :user_landing
    get '/:username/register/:plan' => 'registrations#new', as: :new_account_registration
    get '/:username/register' => 'registrations#new', as: :registration
    post '/account/register' => 'devise/registrations#create', as: :account_registration
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  devise_for :accounts
end
