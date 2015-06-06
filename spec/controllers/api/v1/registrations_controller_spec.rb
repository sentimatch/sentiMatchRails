require 'spec_helper'

describe Api::V1::RegistrationsController do

let(:json) { ActiveSupport::JSON.decode(response.body) }

	context "POST /api/v1/registrations" do
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
			xhr :post, :create, create_params_1, format: :json
			expect(json["email"]).to eq("gamer@gmail.com")
		end

		it "fails with incorrect params" do
			xhr :post, :create, create_params_2, format: :json
			expect(json["error"]).to eq("Auth token can't be blank, Auth secret can't be blank")
		end

	end

end
