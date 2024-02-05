# frozen_string_literal: true

# spec/sinsonic_spec.rb

require_relative "spec_helper"

describe "Sinsonic API" do
  it "responds with ok on ping.view" do
    get "/rest/ping.view"
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to eq("status" => "ok")
  end

  it "responds with license info on getLicense.view" do
    get "/rest/getLicense.view"
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to eq("license" => { "valid" => true, "email" => "user@example.com",
                                                                "key" => "your_license_key" })
  end
end
