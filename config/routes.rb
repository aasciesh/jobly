Jobly::Application.routes.draw do

#TODO: Take off resources development before putting into production
  resources :user_profiles, :session, :company_profiles, :users, :development, :vacancies, :language_skills, :references,
  			:qualifications, :experiences
  root :to => 'home#index'
  match '/signin', to: 'session#new'
  match '/signout', to:'session#destroy', via: :delete
  match '/signup', to: 'user_profiles#new'
  match '/activate/:code', to: 'users#activate', via: :get
  match '/resend_confirmation/:id', to: 'users#send_confirmation_link', via: :put
  match '/session/create', to: 'session#create', via: :post

end
