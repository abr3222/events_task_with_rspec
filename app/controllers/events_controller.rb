# frozen_string_literal: true

class EventsController < ApplicationController
  # TODO: implement the event saving endpoint
  def save
    event = Event.new(event_params)
    if event.save
      render json: event, status: 200
    else
      render  status: 400
    end
  end
  def event_params
    { employee_id: params[:employee_id], timestamp: Time.at(params[:timestamp].to_i), kind: params[:kind] }
  end

end
