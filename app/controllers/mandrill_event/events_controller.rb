module MandrillEvent
  class EventsController < ActionController::Base

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
