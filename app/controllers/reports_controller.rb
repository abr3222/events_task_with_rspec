# frozen_string_literal: true

class ReportsController < ApplicationController
  # TODO: implement report generation endpoint - it should delegate to ReportGenerator
  def get
    reports = ReportGenerator.call(params)
    render json: response, status: 400
  end

end
