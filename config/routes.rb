Rails.application.routes.draw do
  
  get '/dashboard' => 'dashboard#index', as: :dashboard
  get '/' => 'static#home'
  get '/terms_conditions' => 'static#terms_conditions', as: :terms_conditions

  devise_scope :account do
    get '/:current_user' => 'devise/registrations#new', as: :register 
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  devise_for :accounts
end
