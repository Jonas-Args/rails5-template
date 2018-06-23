require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  api vendor_string: "myvendor", default_version: 1 do
    version 1 do
      cache as: 'v1' do
        resources :users do
          collection do
            patch :inactive
            patch :forgot_password
            patch :reset_password
          end
        end
        resources :drivers do
          collection do
            patch :inactive
            patch :forgot_password
            patch :reset_password
          end
        end
        resource :sessions do
        end
        resources :cars do
          collection do
            post :create_car
          end
        end
      end
    end
  end
  mount Sidekiq::Web => '/sidekiq'
  root to: "application#index"
end
