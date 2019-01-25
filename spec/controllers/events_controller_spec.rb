require 'rails_helper'

RSpec.describe MandrillEvent::EventsController, type: :controller do
  routes { ::MandrillEvent::Engine.routes }

  context 'mandrill checks for working endpoint' do
    describe 'HEAD index' do
      it 'returns status 200' do
        head :index
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'with valid event params' do
    describe 'POST create' do
      let(:params) { {mandrill_events: webhook_example_events('rejects')} }

      it 'returns status 200' do
        post :create, params: params
        expect(response).to have_http_status(:ok)
      end

      it 'calls MandrillEvent.process' do
        allow(MandrillEvent).to receive(:process).and_return(true)
        expect(MandrillEvent).to receive(:process)
        post :create, params: params
      end
    end
  end
end
