Jobly::Application.routes.draw do

#TODO: Take off resources development before putting into production
<<<<<<< HEAD
  resources :user_profiles, :session, :company_profiles, :users, :development, :vacancies, :language_skills
  root :to => 'home#index'  
=======
  resources :user_profiles, :session, :company_profiles, :users, :development, :vacancies, :language_skills, :static
  root :to => 'static#home'
  match '/user_profiles/:id/cv', :controller => 'user_profiles', :action => 'show_cv', via: :get , as: 'show_cv'
  match '/test', to: 'static#test'
>>>>>>> d5681636a3590f4ea3024c295523aec5483691a3
  match '/signin', to: 'session#new'
  match '/signout', to:'session#destroy', via: :delete
  match '/signup', to: 'user_profiles#new'
  match '/activate/:code', to: 'users#activate', via: :get
  match '/resend_confirmation/:id', to: 'users#send_confirmation_link', via: :put
  match '/session/create', to: 'session#create', via: :post

end
