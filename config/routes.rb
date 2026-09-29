Rails.application.routes.draw do
  get  'new'    => 'game#new',    :as => 'new_game'
  post 'create' => 'game#create', :as => 'create_game'
  get  'show'   => 'game#show',   :as => 'game'
  post 'guess'  => 'game#guess',  :as => 'guess'
  get  'win'    => 'game#win',    :as => 'win_game'
  get  'lose'   => 'game#lose',   :as => 'lose_game'

  # Defines the root path route ("/")
  root 'game#new'

  # See how all your routes lay out with "bin/rails routes".
  # Rails routing guide: https://guides.rubyonrails.org/v7.2/routing.html
end
