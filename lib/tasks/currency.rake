namespace :currency do
  desc 'load new currencies'
  task update: :environment do
    url = 'http://www.cbr.ru/scripts/XML_daily.asp'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = Hash.from_xml(response)['ValCurs']['Valute']

    if response_obj.present?
      Currency.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!(Currency.table_name)

      response_obj.each do |currency|
        Currency.create(name: currency['Name'], rate: currency['Value'].gsub(',', '.'))
      end

      puts 'Курсы валют успешно обновлены'
    else
      puts 'Произошла ошибка!'
    end
  end
end
