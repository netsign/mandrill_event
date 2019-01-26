module MandrillEvent
  class EventsController < ActionController::Base
    skip_before_action :verify_authenticity_token, raise: false

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
