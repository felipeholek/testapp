# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/cities/query')

  resources :cities, only: %i[query] do
    collection do
      get :query, to: 'cities#query', as: 'query'
    end
  end
end
