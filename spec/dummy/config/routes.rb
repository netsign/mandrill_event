require 'mandrill_event/engine'

Rails.application.routes.draw do
  mount MandrillEvent::Engine => "/mandrill"
end
