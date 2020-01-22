require 'rails_helper'

describe 'currency.rake' do
  before do
    Rails.application.load_tasks
  end

  context 'after rake task run' do
    it 'load 34 currencies' do
      Rake::Task['currency:update'].invoke
      expect(Currency.count).to eq(34)
    end
  end
end
