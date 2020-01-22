require 'rails_helper'
Rails.application.load_tasks

RSpec.describe CurrenciesController, type: :controller do
  before do
    Rake::Task['currency:update'].invoke
  end

  let(:token) do
    JWT.encode('secure string', 'secret')
  end

  describe '#index' do
    context 'when authorization token provided' do
      before { request.headers.merge!('Authorization' => token) }

      it 'returns a 200 OK status' do
        get :index, params: { page: 1 }
        expect(response).to have_http_status(:success)
      end

      it 'returns valid JSON' do
        get :index, params: { page: 1 }
        body = JSON.parse(response.body)
        expect(body['currencies']).to be_present
        expect(body['current_page']).to eq(1)
        expect(body['total_entries']).to eq(Currency.count)
      end
    end

    context 'when authorization token is wrong' do
      before { request.headers.merge!('Authorization' => 'wrongtoken') }

      it 'returns a 401 error status' do
        get :index, params: { page: 2 }
        expect(response).to have_http_status(401)
      end
    end
  end
end
