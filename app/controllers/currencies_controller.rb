class CurrenciesController < ApiController
  def index
    @currencies = Currency.all.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.json { render json: @currencies.to_json }
    end
  end

  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.json { render json: @currency.to_json }
    end
  end
end
