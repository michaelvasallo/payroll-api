module Api
  class UploadsController < ApplicationController
    def create
      file = params[:file]
      report_id = extract_report_id(file.original_filename)

      if TimeReport.exists?(report_id)
        render json: { error: "Report ID #{report_id} already exists" }, status: :unprocessable_entity
        return
      end

      time_entries_data = CsvParserService.new(file).call
      TimeReportCreatorService.new(report_id, time_entries_data).call

      render json: { message: 'File uploaded successfully' }, status: :ok
    end

    private

    def extract_report_id(filename)
      filename.match(/time-report-(\d+)\.csv/)[1].to_i
    end
  end
end
