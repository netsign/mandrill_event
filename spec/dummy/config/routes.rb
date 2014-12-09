Rails.application.routes.draw do
  mount MandrillEvent::Engine => "/mandrill"
end
