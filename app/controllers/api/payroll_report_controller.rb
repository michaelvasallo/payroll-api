module Api
  class PayrollReportController < ApplicationController
    def show
      time_reports = TimeReport.includes(:time_entries).all
      payroll_report = PayrollCalculatorService.new(time_reports).call
      render json: { payrollReport: payroll_report }
    end
  end
end
