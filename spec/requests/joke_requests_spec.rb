require "rails_helper"

describe "when a joke request SMS is received" do
  it "sends back a random joke" do
    post "/joke_requests", params: { From: "+33642755592", Body: "Help! I need a joke" }

    expect(SendJokeJob).to have_been_enqueued.with(to: "+33642755592")
  end
end
