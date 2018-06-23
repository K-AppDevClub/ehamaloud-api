Rails.application.routes.draw do
  resources :voices
  resources :scores
  get 'scores/:id/voice' => 'scores#get_voice'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
