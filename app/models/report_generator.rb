# frozen_string_literal: true

class ReportGenerator
  # TODO: - fetch range of events and generate Report
  def self.call(report_params)
    filtered_events = Event.where("employee_id =? AND DATE(timestamp) >=? AND DATE(timestamp) <=?", report_params[:employee_id], report_params[:from], report_params[:to])
  end

  def params_validator
  end

  def prepare_response
    {
      employee_id: report_params[:employee_id],
      from: report_params[:from],
      to: report_params[:to],
      worktime_hrs: 999.99,
      problematic_dates: ["2022-06-19", "2022-06-19", "2022-06-19"]
    }
  end
end
