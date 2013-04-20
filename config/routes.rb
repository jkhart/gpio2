GPIO2::Application.routes.draw do
  resources :users

  resource :light, only: :show do
    put ":transition", action: :switch, on: :member, constraints: { transition: /(on|off)/ }, as: :switch
  end
end
