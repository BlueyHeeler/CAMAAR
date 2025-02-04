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
  get 'singup', to: 'users#new'     # Mostra formulário
  post "login", to: "home#authenticate"
  post 'signup', to: 'users#create'
  delete "logout", to: "home#logout"

  get 'home/gerenciamento'

  get 'home/homepage'
  get "up" => "rails/health#show", as: :rails_health_check
end
