class JokeRequestsController < ApplicationController

  def create
    SendJokeJob.perform_later(to: params[:From])

    head :ok
  end
end
