require "rails_helper"

describe SendJokeJob do
  describe "#perform" do
    it "sends a SMS with the joke content to the given number" do
      create(:joke, content: "Pouët")
      twilio = stub_twilio_api

      SendJokeJob.perform_now(to: "+3312345678")

      expect(twilio).to have_received(:send_sms).with(content: "Pouët", to: "+3312345678")
    end

    def stub_twilio_api
      twilio = double("twilio", send_sms: true)
      allow(TwilioApi).to receive(:new).and_return(twilio)
      twilio
    end
  end
end
