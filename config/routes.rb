# config/routes.rb
require "sidekiq/web"

Rails.application.routes.draw do
  ############################################################
  # Authentication — friendly paths (login/logout/register)
  ############################################################
  devise_for :users, path: "", path_names: {
    sign_in:  "login",
    sign_out: "logout",
    sign_up:  "register"
  }

  ############################################################
  # Admin-only Sidekiq dashboard
  ############################################################
  class AdminConstraint
    def self.matches?(request)
      user_id = request.session["warden.user.user.key"]&.dig(0, 0)
      user_id && User.find_by(id: user_id)&.admin?
    end
  end

  constraints AdminConstraint do
    mount Sidekiq::Web => "/sidekiq"
  end

  ############################################################
  # Public landing page  (always /)
  ############################################################
  root "home#index"

  ############################################################
  # Dashboard for authenticated users
  ############################################################
  authenticated :user do
    get "/dashboard", to: "products#index", as: :dashboard
  end

  ############################################################
  # Application resources
  ############################################################
  resources :products
  resources :categories, only: %i[index show]
  resources :tags,       only: %i[index show]

  ############################################################
  # Health-check endpoint
  ############################################################
  get "/up", to: proc { [200, { "Content-Type" => "text/plain" }, ["OK"]] }
end
