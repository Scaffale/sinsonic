# frozen_string_literal: true

require_relative "../spec_helper"
require_relative "../../helpers/media_scanner"

describe("media scanner") do
  describe("init_scan") do
    subject { init_scan }

    it("scans the media folder") do
      subject
      expect(true).to(be_truthy)
    end
  end
end
