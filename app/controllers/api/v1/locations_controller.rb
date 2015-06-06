class Api::V1::LocationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  respond_to :json

end