require 'rails_helper'
require 'spec_helper'

describe MandrillEvent::EventsController, :type => :controller do

  def webhook(params)
    post :create, params.merge(use_route: :mandrill)
  end

  context 'mandrill checks for working endpoint' do

    describe 'HEAD index' do

      it 'returns status 200' do
        head :index, use_route: :mandrill
        expect(response.code).to eq('200')
      end

    end

  end

  context 'with valid event params' do

    describe 'POST create' do

      it 'returns status 200' do
        webhook event: :reject, foo: :bar
        expect(response.code).to eq('200')
      end

    end

  end

end
