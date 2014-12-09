MandrillEvent::Engine.routes.draw do
  resource :events, only: [:show, :create]
end
