class CurrenciesController < ApiController
  def index
    @currencies = Currency.all.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.json do
        render json: {
          current_page: @currencies.current_page,
          per_page: @currencies.per_page,
          total_entries: @currencies.total_entries,
          currencies: @currencies.to_json
        }
      end
    end
  end

  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.json { render json: @currency.to_json }
    end
  end
end
