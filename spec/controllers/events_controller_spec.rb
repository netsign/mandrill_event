require 'rails_helper'
require 'spec_helper'

describe MandrillEvent::EventsController, :type => :controller do

  def webhook(params)
    post :create, params.merge(use_route: :mandrill)
  end

  context 'with valid event params' do

    describe 'POST create' do

      it 'returns status 200' do
        webhook event: :reject, foo: :bar
        expect(response.code).to eq("200")
      end

    end

  end

end
