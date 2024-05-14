class TimeReportCreatorService
  def initialize(report_id, time_entries_data)
    @report_id = report_id
    @time_entries_data = time_entries_data
  end

  def call
    TimeReport.create!(id: @report_id, time_entries_attributes: @time_entries_data)
  end
end
