Rails.application.routes.draw do
  resources :respondidos
  resources :resposta
  resources :questao_options
  resources :questaos
  resources :questionarios
  resources :templates
  resources :matriculas
  resources :turmas
  resources :materia
  resources :departamentos
  resources :coordenadors
  resources :users

  root 'home#login'
  get 'home/login'
  get "login", to: "home#login"
  get 'signup', to: 'users#new'     # Mostra formulário
  post 'signup', to: 'users#create'
  post "login", to: "home#authenticate"
  delete "logout", to: "home#logout"
  
  post 'home/import_data_materia', to: 'home#import_data_materia'

  get 'home/gerenciamento_templates'
  get 'home/homepage'
  get "up" => "rails/health#show", as: :rails_health_check
end
