class ApiController < ApplicationController
  VERY_SECURE_STRING = 'secure string'
  VERY_SECURE_TOKEN = 'eyJhbGciOiJIUzI1NiJ9.InNlY3VyZSBzdHJpbmci._EZH5dX9UCDY_L1NbOv4-wpyPrUly-XMfWNLqn2fDjk'
  before_action :set_default_format, :authenticate_request!

  def authenticate_request!
    token = request.headers['Authorization']
    JWT.decode(token, 'secret') == VERY_SECURE_STRING
  end

  private

  def set_default_format
    request.format = :json
  end
end
