class Api::V1::LocationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  respond_to :json

  def checkedin_users
    u = User.find_by(uauth_token: params[:token]) 
    if u.present?
      render json: User.checkedin_users(params[:location_id]).to_json, status: :ok
    else
      render json: { error: "unauthorized" }, status: :unprocessable_entity
    end
  end

  def checkin
    
    u = User.find_by(uauth_token: params[:token]) 
    
    if u.present?
      
      if u.check_in(params[:location_id])
        render json: User.all.to_json, status: :ok
      else
        render json: { error: "error checking in" }, status: :unprocessable_entity
      end

    else
      render json: { error: "unauthorized" }, status: :unprocessable_entity
    end

  end

end