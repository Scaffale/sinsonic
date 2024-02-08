# frozen_string_literal: true

RSpec.shared_examples "a successful request" do
  let(:subject_body) do
    subject
    last_response.body
  end

  it { is_expected.to be_ok }

  it "should have correct body" do
    expect(subject_body).to be_equivalent_to(expected_response)
  end
end
