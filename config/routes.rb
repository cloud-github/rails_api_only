Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, path: '', defaults: { format: :json } do
    namespace :v1 do
      # events/hooks routes
      resources :events, only: [] do
        collection do
          get :test_api
        end
      end

      resources :macro_categories
      resources :macros do
        collection do
          delete :destroy
        end
      end
    end
  end
end
