module MandrillEvent
  class EventsController < ActionController::Base
    protect_from_forgery with: :null_session

    def index
      head :ok
    end

    def create
      MandrillEvent.process(params)
      head :ok
    # rescue MandrillEvent::UnauthorizedError
    #   head :unauthorized
    end
  end
end
