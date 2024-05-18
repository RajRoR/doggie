# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/dogs/search/new' => 'dogs#new'
  get '/dogs/fetch' => 'dogs#fetch'

  # Defines the root path route ("/")
  root 'dogs#new'
end
