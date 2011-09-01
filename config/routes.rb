NetspireAdmin::Application.routes.draw do
    root :to => redirect("/admin/dashboard")
    devise_for :admin

    devise_scope :admin do
        get "/logout" => "devise/sessions#destroy", :as => :destroy_admin_session
    end

    namespace :admin do
        root :to => redirect("/admin/dashboard")
        match "/dashboard", :to => "dashboard#index", :as => :dashboard

        resources :accounts
        resources :transactions

        scope("/billing") do
            resources :plans
        end

        scope("/settings") do
            resources :radius_replies
            resources :radius_reply_groups
        end

        namespace :iptraffic do
            resources :sessions
        end
    end
end
