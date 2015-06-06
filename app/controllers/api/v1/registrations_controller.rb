class Api::V1::RegistrationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  respond_to :json

  def create
  	u = User.new(params.permit(:email, :password, :name, :password_confirmation, :lat, :lng, :auth_token, :auth_secret))
  	if u.save
  		render json: u.to_json, status: :ok
  	else
  		render json: { error: u.errors.full_messages.join(', ') }, status: :unprocessable_entity
  	end   	
  end

  def show
  	u = User.find_by(uauth_token: params[:token]) 
  	if u.present?
  		render json: u.to_json, status: :ok
  	else
  		render json: { error: "profile not found" }, status: :unprocessable_entity
  	end
  end
end