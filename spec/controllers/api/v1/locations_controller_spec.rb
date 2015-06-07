require 'spec_helper'

describe Api::V1::LocationsController do

let(:json) { ActiveSupport::JSON.decode(response.body) }

	context "POST /api/v1/locations" do
		let(:create_params_1) { { 
                                "email"=> "gamer@gmail.com",
                                "password"=> "samplepassword",
                                "password_confirmation"=> "samplepassword",
                                "name"=> "Pranav Dhar",
                                "lat"=> "12.3456",
                                "lng"=> "12.3456",
                                "auth_token" => "2200730853-0GZxXFvKPH4bmeFpw33VPSBYoP544dpr5KDuD1Y",
                                "auth_secret" => "GwsWCOUW1PmbjRm5fWOrIixLqSb9QO5ENsS7DH06pWifC"
                            } }    

    let(:create_params_2) { { 
        "email"=> "gamer@gmail.com",
        "password"=> "samplepassword",
        "password_confirmation"=> "samplepassword",
        "name"=> "Pranav Dhar"
    } }    

		it "succeed with correct params" do
			u = User.new(create_params_1)
			u.save
			$redis.flushdb
			location = "123"
			xhr :get, :checkin, {token: u.uauth_token, location_id: location}
			expect(User.checkedin_users(location).first).to eq(u)
			
			xhr :get, :checkedin_users, {token: u.uauth_token, location_id: location}, format: :json
			expect( json[0]["email"]).to eq("gamer@gmail.com")

		end

	end

end
