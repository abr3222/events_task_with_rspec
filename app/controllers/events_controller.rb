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
    { employee_id: employee_id, timestamp: time_stamp, kind: kind }
  end

  def employee_id
    @employee_id ||= params[:employee_id].nil? ? nil : params[:employee_id]
  end

  def time_stamp
    # return nil if params[:timestamp] == 'bad'
    @time_stamp ||= params[:timestamp].to_i == 0 ?  nil : Time.at(params[:timestamp].to_i).to_datetime
  end

  def kind
    @kind ||= Event.kinds.keys.include?(params[:kind]) ? params[:kind] : nil
  end
end
