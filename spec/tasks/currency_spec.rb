require 'rails_helper'
Rails.application.load_tasks

describe 'currency.rake' do
  context 'before rake task run' do
    it 'currencies should be empty' do
      expect(Currency.count).to eq(0)
    end
  end

  context 'after rake task run' do
    it 'updates currencies' do
      Rake::Task['currency:update'].invoke
      expect(Currency.count).to eq(34)
    end
  end
end
