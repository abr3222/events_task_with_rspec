# frozen_string_literal: true

class ReportsController < ApplicationController
  # TODO: implement report generation endpoint - it should delegate to ReportGenerator
  def get
    # binding.pry
    if params_validator?
      # binding.pry
      response = ReportGenerator.new.call(params)
      # binding.pry
      render json: response, status: 200
    else
      render  status: 400
    end

  end

  def employee_id
    @employee_id ||= params[:employee_id].to_i ==0 ? false : params[:employee_id]
  end

  def from
    @from ||= params[:from].to_i == 0 ? false : params[:from]
  end

  def to
    @to ||= params[:to].to_i == 0 ? false : params[:to]
  end

  def params_validator?
    employee_id && from && to
  end
end
