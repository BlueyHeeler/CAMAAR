Rails.application.routes.draw do
  resources :respondidos
  resources :resposta
  resources :questionarios
  resources :templates do
    resources :questaos
  end
  resources :matriculas
  resources :turmas
  resources :materia
  resources :departamentos
  resources :coordenadors
  resources :users

  root 'home#login'
  get 'home/login'
  get "login", to: "home#login"
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  post "login", to: "home#authenticate"
  delete "logout", to: "home#logout"
  
  post 'home/import_data_materia', to: 'home#import_data_materia'
  post 'home/import_data_classes'
  post 'home/import_data_members'

  get 'home/gerenciamento_ver_respostas'
  get 'home/gerenciamento_enviar_templates'
  get 'home/gerenciamento_templates'
  get 'home/homepage'
  get "up" => "rails/health#show", as: :rails_health_check
end
