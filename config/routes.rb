# frozen_string_literal: false

Rails.application.routes.draw do
  resources :toys, except: :show
end
