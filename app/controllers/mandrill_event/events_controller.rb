module MandrillEvent
  class EventsController < ActionController::Base
    def create
      MandrillEvent.instrument(params)
      head :ok
    # rescue MandrillEvent::UnauthorizedError
    #   head :unauthorized
    end
  end
end
