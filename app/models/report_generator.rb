# frozen_string_literal: true

class ReportGenerator
  # TODO: - fetch range of events and generate Report
  def call(report_params)
    params(report_params)
    filtered_events = Event.where("employee_id =? AND DATE(timestamp) >=? AND DATE(timestamp) <=?", params[:employee_id], params[:from], params[:to]).order(:timestamp)

    time_count =  0
    problomatic_date = []

    filtered_events.group_by { |event|
      event.timestamp.to_date
    }.flat_map { |day, events|
      # puts day
      # puts events.class
      if events.count != 2
        problomatic_date << day
      else
        # puts "FIRST IN  ID #{puts events.first.id} IN KIND #{events.first.kind}"
        # puts events.first.timestamp
        # puts "OUT ID #{puts events.last.id} OUT KIND #{events.last.kind}"
        # puts events.last.timestamp
        time_count += events.last.timestamp - events.first.timestamp
      end

    }
    total_hours = ((time_count/60)/60).round(2)
    response_build(total_hours,problomatic_date)
  end

  def params(report_params=nil)
    @params ||= report_params
  end

  def employee_id
    @employee_id ||= params["employee_id"]
  end

  def response_build(working_hours,problematic_dates = [])
    {
      employee_id: employee_id.to_i,
      from: params["from"],
      to: params["to"],
      worktime_hrs: working_hours,
      problematic_dates: problematic_dates
    }
  end
end
