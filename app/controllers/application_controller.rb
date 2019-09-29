class ApplicationController < ActionController::API
  before_action :set_cors
  def set_cors
    headers["Access-Control-Allow-Methods"] = "GET, PUT, POST, DELETE"
  end
end
