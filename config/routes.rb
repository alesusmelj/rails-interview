Rails.application.routes.draw do
  namespace :api do
    resources :todo_lists, path: :todolists do
      resources :todo_items, only: %i[ update create ] do
        member do
          patch 'complete'
        end
      end
    end
  end

  resources :todo_lists, only: %i[index new], path: :todolists
end
